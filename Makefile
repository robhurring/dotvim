FILES=vimrc vim
TARGETS=$(FILES:%=$(HOME)/.%)
CWD=$(shell pwd)

$(HOME)/.%: %
	@if [ -e $@ ]; then mv $@ $@.bak; fi
	@echo "Linking $<"
	@ln -snf $(CWD)/$< $@

# TODO: clean this up
install: $(TARGETS)
	$(MAKE) neovim
	$(MAKE) bundle

neovim:
	@mkdir -p $(HOME)/.config
	@ln -nsf $(HOME)/.vim $(HOME)/.config/nvim
	@ln -nsf $(HOME)/.vimrc $(HOME)/.config/nvim/init.vim

uninstall:
	rm -f $(TARGETS)

update:
	git pull
	$(MAKE) bundle-update

clean:
	vim +PlugClean! +qall

bundle:
	vim +PlugInstall +PlugClean! +qall

bundle-update:
	vim +PlugUpdate +PlugClean! +qall

snapshot:
	@mkdir -p ~/.vim/snapshots
	vim +"PlugSnapshot ~/.vim/snapshots/plugins.$(shell date +%y-%m-%d).snapshot" +qall

bootstrap: .fzf .lua .vim .plug

.plug:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

.vim: .fzf .lua
	brew install vim --with-lua

.fzf:
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install

# https://neovim.io/doc/user/nvim_python.html
nvim: install
	[[ $(shell which pip2) ]] && sudo pip2 install neovim
	[[ $(shell which pip3) ]] && sudo pip3 install neovim
	nvim +UpdateRemotePlugins +qall

.PHONY: install uninstall update
