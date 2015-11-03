# My Vim Config

This is my vim setup.

### Installing

###### vanilla vim

1. clone repo to ~/.dotvim
1. cd ~/.dotvim
1. `make bootstrap`
    * installs `vim-plug`
    * installs `lua` for `neocomplete`
    * installs `vim --with-lua`
1. `make install`
    * installs necessary dotfiles

###### for neovim

1. follow instructions above for vanilla vim
1. install neovim using `brew install --HEAD neovim`
1. run `make neovim-bootstrap` to install pip dependencies
    * tries to install the pip neovim stuff and update remote plugins
1. wait for `pip` to fail somehow
1. scratch head
1. run again and hope for the best
1. run `make neovim`
    * link vim to the XDG config folders

### Updating

* run `make update` to update any plugins and the `.dotvim` code

### Plugins

All the plugins are listed in `vimrc` and are handled by `vim-plug`

###### Installing

* run `make bundle` to install any new bundles

###### Cleaning

* run `make clean` to clean any removed bundles

###### Updating

* run `make update` to update any plugins and the `.dotvim` code

###### Snapshotting

* run `make snapshot` to lock your plugin versions to `~/.vim/snapshots/plugins.{date}.snapshot`

