#!/bin/bash

DIR=$HOME/git/devbox
TAG=dev

if [ -z "$DOCKER_HOST" ] ; then
    source $HOME/.docker.env
    docker_env
fi

name=$TAG
for i in `seq 1 10`; do
        tryname=$name$i
        name_exists=`docker ps --filter name=$tryname | grep -v 'CONTAINER ID' | wc -l | sed -e 's/ //g'`
        if [ "$name_exists" = 0 ] ; then
                cname=$tryname
                break
        fi
done

docker run \
        --rm \
        -it \
        $DEVBOX_RUN_OPTS \
        --name $cname \
        --hostname $cname \
        -v $HOME/git:/home/dev/git \
        dev
