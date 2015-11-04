```
                            ██╗   ██╗██╗███╗   ███╗
                            ██║   ██║██║████╗ ████║
                            ██║   ██║██║██╔████╔██║
                            ╚██╗ ██╔╝██║██║╚██╔╝██║
                          ██╗╚████╔╝ ██║██║ ╚═╝ ██║
                          ╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝
                                    My (N)VIM setup
```

### Installing

###### vanilla vim

1. clone repo to ~/.dotvim
1. cd ~/.dotvim
1. `make bootstrap` (OSX only - via homebrew)
    * installs `lua`
    * installs `vim --with-lua`
1. `make install`
    * installs necessary dotfiles

###### for neovim

1. follow instructions above for vanilla vim
1. `make bootstrap-neovim`
    * installs `neovim` SEE: [neovim](https://github.com/neovim/homebrew-neovim/blob/master/README.md)
    * installs neovim's pip dependencies
1. run `make neovim`
    * link vim to the `XDG_CONFIG_HOME` dotfiles

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

