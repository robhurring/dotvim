#!/usr/bin/env sh
MIMHOME="$HOME/.mim"
RCPATH="$HOME/.mimrc"
\curl -fLo $MIMHOME/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
\curl -sSL https://raw.githubusercontent.com/robhurring/dotvim/master/mim/mimrc > $RCPATH
tee <<"DONE"

             _       _            _
   _ __ ___ (_)_ __ (_)    __   _(_)_ __ ___
  | '_ ` _ \| | '_ \| |____\ \ / / | '_ ` _ \
  | | | | | | | | | | |_____\ V /| | | | | | |
  |_| |_| |_|_|_| |_|_|      \_/ |_|_| |_| |_|
      a light-weight, portable and cozy vimrc!


  Installation complete!

  To use add the following alias to your $HOME/.bashrc:

    alias mim="vim -u ~/.mim"

  Or run manually with:

    vim -u ~/.mimrc

  NOTE: Plugins will be installed on first run. You can close
        the installation window with 'q'

DONE
