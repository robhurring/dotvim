FILES = vimrc vimrc.bundles vim
TARGETS=$(FILES:%=$(HOME)/.%)
CWD=$(shell pwd)

$(HOME)/.%: %
	@if [ -e $@ ]; then mv $@ $@.bak; fi
	@echo "Installing $<"
	@ln -sf $(CWD)/$< $@

install: $(TARGETS) 
	vim +:PlugInstall +qall

uninstall:
	rm -f $(TARGETS)

update:
	git pull
	vim +PlugInstall +qall

.PHONY: install uninstall update
