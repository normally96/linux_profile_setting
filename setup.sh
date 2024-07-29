#!/bin/bash
CONF_DIRS=./conf_files
TMUX_CONF=.tmux.conf
VIM_CONF=.vimrc
CTAGS_CONF=default.ctags
CTAGS_DIR=$HOME/.ctags.d/
PWD=$(pwd)
MY_BASHRC=.bash_anie

OPTION=$1

mkdir -p $CTAGS_DIR

if [[ $OPTION == "save" ]]; then
    echo "Saving environment..."
    mkdir -p ~/.tmux/plugins/tmp
    cp ~/$TMUX_CONF ~/$CONF_DIRS   
    cp ~/$VIM_CONF  ~/$CONF_DIRS
    cp ~/$CTAGS_CONF  ~/$CTAGS_DIR
else
    echo "Installing environment..."
    cp $CONF_DIRS/$TMUX_CONF ~
    cp $CONF_DIRS/$VIM_CONF ~
    cp $CONF_DIRS/$CTAGS_CONF $CTAGS_DIR
fi

source $PWD/$CONF_DIRS/$MY_BASHRC
