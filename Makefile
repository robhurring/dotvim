XDG_CONFIG_HOME ?= $(HOME)/.config
SNAPSHOTS_HOME ?= $(HOME)/.vim/snapshots
CWD=$(shell pwd)

DOTFILES=vimrc vim
TARGETS=$(DOTFILES:%=$(HOME)/.%)

install: $(TARGETS)
	@make bundle

neovim: $(XDG_CONFIG_HOME)/nvim $(XDG_CONFIG_HOME)/nvim/init.vim
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
	vim +PlugClean! +qall

bundle:
	vim +PlugInstall +PlugClean! +qall

bundle-update:
	vim +PlugUpdate +PlugClean!

snapshot:
	@mkdir -p $(SNAPSHOTS_HOME)
	vim +"PlugSnapshot $(SNAPSHOTS_HOME)/plugins.$(shell date +%y-%m-%d).snapshot" +qall

# ---> file targets

$(HOME)/.%: %
	@if [ -e $@ ]; then mv $@ $@.bak; fi
	@echo "Linking $<"
	@ln -snf $(CWD)/$< $@

$(XDG_CONFIG_HOME)/nvim: $(HOME)/.vim
	@mkdir -p $(XDG_CONFIG_HOME)
	@ln -nsf $< $@

$(XDG_CONFIG_HOME)/nvim/init.vim: $(HOME)/.vimrc
	@ln -nsf $< $@

# ---> dependencies

.vim:
	brew install lua
	brew install vim --with-lua

# https://neovim.io/doc/user/nvim_python.html
.neovim:
	brew tap neovim/neovim
	brew install neovim
	[[ $(shell which pip2) ]] && sudo pip2 install neovim
	[[ $(shell which pip3) ]] && sudo pip3 install neovim
	nvim +UpdateRemotePlugins +qall

