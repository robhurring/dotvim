XDG_CONFIG_HOME ?= $(HOME)/.config
SNAPSHOTS_HOME ?= $(HOME)/.vim/snapshots
CWD=$(shell pwd)

DOTFILES=vim
TARGETS=$(DOTFILES:%=$(HOME)/.%)
USEVIM?=vim

all: $(TARGETS)
	@make bundle

install: $(TARGETS) homebrew
	@make bundle

neovim: $(XDG_CONFIG_HOME)/nvim $(XDG_CONFIG_HOME)/nvim/init.vim homebrew
	[[ $(shell which pip2) ]] && pip2 install --upgrade neovim
	[[ $(shell which pip3) ]] && pip3 install --upgrade neovim
	@make bundle

uninstall:
	rm -f $(TARGETS)

# ---> plugin commands

update: snapshot
	@git pull
	@make bundle-update

clean:
	$(USEVIM) +PlugClean! +qall

bundle:
	$(USEVIM) +PlugInstall +PlugClean! +qall

bundle-update:
	$(USEVIM) +PlugUpgrade +PlugUpdate +PlugClean!

snapshot:
	@mkdir -p $(SNAPSHOTS_HOME)
	$(USEVIM) +"PlugSnapshot $(SNAPSHOTS_HOME)/plugins.$(shell date +%y-%m-%d).snapshot" +qall

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

homebrew:
	@type brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	@brew bundle check || brew bundle

.PHONY: all install neovim uninstall update clean bundle bundle-update snapshot homebrew
