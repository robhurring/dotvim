FILES = vimrc bundles.vim vim
TARGETS=$(FILES:%=$(HOME)/.%)
CWD=$(shell pwd)

$(HOME)/.%: %
	@if [ -e $@ ]; then mv $@ $@.bak; fi
	@echo "Installing $<"
	@ln -sf $(CWD)/$< $@

install: $(TARGETS) .lua .vim
	vim +:PlugInstall +qall

uninstall:
	rm -f $(TARGETS)

update:
	git pull
	vim +PlugInstall +qall

clean:
	vim +PlugClean! +qall

plug:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

.lua:
	brew install lua

.vim:
	brew install vim --with-lua

.PHONY: install uninstall update
