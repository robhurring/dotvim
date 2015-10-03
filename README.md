# My Vim Config

This is my vim setup.

### Installing

###### vanilla vim

1. clone repo to ~/.dotvim
1. cd ~/.dotvim
1. `make install`
    * installs necessary dotfiles
1. `make bootstrap`
    * installs `vim-plug`
    * installs `lua` for `neocomplete`
    * installs `vim --with-lua`

###### for nvim

1. run `make nvim` to install pip dependencies
    * tries to install `neovim` for python2
    * tries to install `neovim` for python3
1. wait for `pip` to fail somehow
1. scratch head
1. run again and hope for the best

### Updating

* run `make update` to update any plugins and the `.dotvim` code

### Plugins

All the plugins are listed in `vim/plugins.vim` and are handled by `vim-plug`

###### Installing

* run `make bundle` to install any new bundles

###### Cleaning

* run `make clean` to clean any removed bundles

###### Updating

* run `make update` to update any plugins and the `.dotvim` code

###### Snapshotting

* run `make snapshot` to lock your plugin versions to `~/.vim/snapshots/plugins.{date}.snapshot`

