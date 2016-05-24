#!/usr/bin/env sh
PVIMHOME=/tmp/pocketvim
INSTALLPATH="$HOME/.pocket-vimrc"
mkdir -p $PVIMHOME/autoload
\curl -fLo $PVIMHOME/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
\curl -sSL https://raw.githubusercontent.com/robhurring/dotvim/master/pocket-vimrc > $INSTALLPATH
tee <<"DONE"
                    _        _             _
   _ __   ___   ___| | _____| |_    __   _(_)_ __ ___
  | '_ \ / _ \ / __| |/ / _ \ __|___\ \ / / | '_ ` _ \
  | |_) | (_) | (__|   <  __/ ||_____\ V /| | | | | | |
  | .__/ \___/ \___|_|\_\___|\__|     \_/ |_|_| |_| |_|
  |_|  a light-weight, portable and cozy vimrc!

  Installation complete!

  To use add the following alias to your $HOME/.bashrc:

    alias pvim="vim -u ~/.pocket-vimrc"

  Or run manually with:

    vim -u ~/.pocket-vimrc

  NOTE: Plugins will be installed on first run. You can close
        the installation window with 'q'

DONE
