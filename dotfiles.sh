#!/usr/bin/bash

# rounds up all the dotfiles and syncs them to the 
# private git repo on home server

# gather files of interest
# - .tmux*
# - .zsh*
# - .ohmyzsh
# - .vim*
# copy them to /tmp/somewhere

HOME="/home/cole"

TEMP=`mktemp -d`
cp $HOME/.*zsh* $HOME/.tmux* $HOME/.vim* $TEMP

rm -rf $TEMP
