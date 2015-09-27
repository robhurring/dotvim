FILES = vimrc vimrc.bundles vim
TARGETS=$(FILES:%=$(HOME)/.%)
CWD=$(shell pwd)

$(HOME)/.%: %
	@if [ -e $@ ]; then mv $@ $@.bak; fi
	@echo "Installing $<"
	@ln -sf $(CWD)/$< $@

install: $(TARGETS) bundle ycm

uninstall:
	rm -f $(TARGETS)

update:
	git pull
	vim +BundleInstall +qall

bundle:
	vim +BundleInstall +qall

ycm:
	vim/bundle/YouCompleteMe/install.py --gocode-completer --clang-completer

.PHONY: install uninstall update
