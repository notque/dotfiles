# Installation

## Prerequisites

  * Git

## Manual Installation

    git clone https://github.com/BugRoger/dotfiles.git ~/.dotfiles
    .dotfiles/script/install

## VIM

Plugins that are published on github can be installed as submodules. 

    cd ~/dotfiles
    git submodule add http://github.com/pangloss/vim-javascript.git vim/bundle/vim-javascript

Updating all plugins

     git submodule foreach git pull
