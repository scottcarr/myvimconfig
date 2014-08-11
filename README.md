myvimconfig
===========

Prerequisites
-------------

1. Vundle

To install: 

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

Installation
------------

    git clone git@github.com:scottcarr/myvimconfig.git
    ln -s myvimconfig/.vimrc ~/.vimrc
    ln -s myvimconfig/.gvimrc ~/.gvimrc
    ln -s myvimconfig/mysnippets ~/.vim/mysnippets

Open vim and run PluginInstall

Build YouCompleteMe:
    
    ./install.sh --clang-completer

For missing fonts on Linux see here: http://customizeubuntu.com/appearance/fonts/install-mac-os-fonts-in-ubuntu 
