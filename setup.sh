#!/bin/bash
CONF_DIRS=./conf_files
TMUX_CONF=.tmux.conf
VIM_CONF=.vimrc

OPTION=$1

if [[ $OPTION == "save" ]]; then
    echo "Saving environment..."
    mkdir -p ~/.tmux/plugins/tmp
    cp ~/$TMUX_CONF ~/$CONF_DIRS   
    cp ~/$VIM_CONF  ~/$CONF_DIRS
else
    echo "Installing environment..."
    cp $CONF_DIRS/$TMUX_CONF ~
    cp $CONF_DIRS/$VIM_CONF ~
fi