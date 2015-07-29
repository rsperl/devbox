#!/bin/bash

DIR=$HOME/git/docker_devbox
TAG=dev

if [ -z "$DOCKER_HOST" ] ; then
    source $HOME/.docker.env
    docker_env
fi

# rm -rf $DIR/src
# mkdir $DIR/src
# tar -C${HOME} -cf $DIR/src/files.tar .docker.env .zsh-custom .zshrc .oh-my-zsh .myenv.zsh .ssh .vimrc .vim .tmux.conf .tmuxinator

cd $DIR && docker build -t $TAG .
