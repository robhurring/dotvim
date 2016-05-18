XDG_CONFIG_HOME ?= $(HOME)/.config
SNAPSHOTS_HOME ?= $(HOME)/.vim/snapshots
CWD=$(shell pwd)

DOTFILES=vim
TARGETS=$(DOTFILES:%=$(HOME)/.%)
MYVIM?=vim

all: $(TARGETS)
	@make bundle

install: $(TARGETS) bootstrap
	@make bundle

neovim: $(XDG_CONFIG_HOME)/nvim $(XDG_CONFIG_HOME)/nvim/init.vim bootstrap-neovim
	@make bundle

uninstall:
	rm -f $(TARGETS)

bootstrap: .vim

bootstrap-neovim: .neovim

# ---> plugin commands

update: snapshot
	@git pull
	@make bundle-update

clean:
	$(MYVIM) +PlugClean! +qall

bundle:
	$(MYVIM) +PlugInstall +PlugClean! +qall

bundle-update:
	$(MYVIM) +PlugUpgrade +PlugUpdate +PlugClean!

snapshot:
	@mkdir -p $(SNAPSHOTS_HOME)
	$(MYVIM) +"PlugSnapshot $(SNAPSHOTS_HOME)/plugins.$(shell date +%y-%m-%d).snapshot" +qall

# ---> file targets

$(HOME)/.%: %
	@if [ -e $@ ]; then mv $@ $@.bak; fi
	@echo "Linking $<"
	@ln -snf $(CWD)/$< $@

$(XDG_CONFIG_HOME)/nvim: $(HOME)/.vim
	@mkdir -p $(XDG_CONFIG_HOME)
	@ln -nsf $< $@

$(XDG_CONFIG_HOME)/nvim/init.vim: $(HOME)/.vim/vimrc
	@ln -nsf $< $@

# ---> dependencies

.vim:
	brew install lua
	brew install vim --with-luajit --with-lua --with-python3

# https://neovim.io/doc/user/nvim_python.html
.neovim:
	brew tap neovim/neovim
	brew upgrade neovim
	[[ $(shell which pip2) ]] && pip2 install --upgrade neovim
	[[ $(shell which pip3) ]] && pip3 install --upgrade neovim
	nvim +UpdateRemotePlugins +qall

