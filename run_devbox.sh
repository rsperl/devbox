#!/bin/bash

DIR=$HOME/git/devbox
TAG=dev
IMAGE=dev

source $HOME/.docker.env
docker_env

#
# find a unique container name based on $TAG
#
name=$TAG
for i in `seq 1 10`; do
        tryname=$name$i
        name_exists=`docker ps --filter name=$tryname | grep -v 'CONTAINER ID' | wc -l | sed -e 's/ //g'`
        if [ "$name_exists" = 0 ] ; then
                cname=$tryname
                break
        fi
done

echo Running image $IMAGE as container $cname
echo "(set env var DEVBOX_RUN_OPTS to set additional run options)"

#
# run the image $IMAGE as container $cname
#
DOCKER_HOME=/home/dev
docker run \
        --rm \
        -it \
        $DEVBOX_RUN_OPTS \
        --name $cname \
        --hostname $cname \
        -v $HOME/.oh-my-zsh:$DOCKER_HOME/.oh-my-zsh \
        -v $HOME/.zsh-custom:$DOCKER_HOME/.zsh-custom \
        -v $HOME/.tmux.conf:$DOCKER_HOME/.tmux.conf \
        -v $HOME/.myenv.zsh:$DOCKER_HOME/.myenv.zsh \
        -v $HOME/.tmuxinator:$DOCKER_HOME/.tmuxinator \
        -v $HOME/.zsh-update:$DOCKER_HOME/.zsh-update \
        -v $HOME/.zshrc:$DOCKER_HOME/.zshrc \
        -v $HOME/.ssh:$DOCKER_HOME/.ssh \
        -v $HOME/.zsh-prompt:$DOCKER_HOME/.zsh-prompt \
        -v $HOME/.my.cnf:$DOCKER_HOME/.my.cnf \
        -v $HOME/.inputrc:$DOCKER_HOME/.inputrc \
        -v $HOME/.gitignore_global:$DOCKER_HOME/.gitignore_global \
        -v $HOME/.gitconfig:$DOCKER_HOME/.gitconfig \
        -v $HOME/.gem:$DOCKER_HOME/.gem \
        -v $HOME/.editrc:$DOCKER_HOME/.editrc \
        -v $HOME/.vimrc:$DOCKER_HOME/.vimrc \
        -v $HOME/.vim:$DOCKER_HOME/.vim \
        -v $HOME/git:/home/dev/git \
        $IMAGE
