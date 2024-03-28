#!/bin/bash

docker run \
     -i -t --privileged \
     -v $HOME/.gitconfig:/root/.gitconfig \
     -v $(pwd)/data:/var/tmp/ruck \
     -v $(pwd)/data:/var/tmp/tiler \
     -v $(pwd)/data:/var/tmp/apt-ostree\
     -v /dev:/dev \
     -v /run:/run \
     -v /sys:/sys \
     -v /var/tmp:/var/tmp \
    -i -t pablo-dev
