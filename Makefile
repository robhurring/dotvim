FILES=vimrc vim nvim nvimrc
TARGETS=$(FILES:%=$(HOME)/.%)
CWD=$(shell pwd)

$(HOME)/.%: %
	@if [ -e $@ ]; then mv $@ $@.bak; fi
	@echo "Installing $<"
	@ln -snf $(CWD)/$< $@

install: $(TARGETS)
	$(MAKE) bundle

uninstall:
	rm -f $(TARGETS)

update:
	git pull
	$(MAKE) bundle

clean:
	vim +PlugClean! +qall

bundle:
	vim +PlugInstall +PlugClean! +qall

bootstrap: .deps
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

.deps:
	brew unlink lua
	brew install lua
	brew link lua
	brew install vim --with-lua

# https://neovim.io/doc/user/nvim_python.html
nvim: install
	[[ $(shell which pip2) ]] && sudo pip2 install neovim
	[[ $(shell which pip3) ]] && sudo pip3 install neovim

.PHONY: install uninstall update
