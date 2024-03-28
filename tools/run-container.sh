#!/bin/bash

docker run \
     --hostname pablo-dev \
     -i -t --privileged \
     -v $HOME/.gitconfig:/home/user/.gitconfig \
     -v $(pwd)/data:/var/tmp/ruck \
     -v $(pwd)/data:/var/tmp/tiler \
     -v $(pwd)/data:/var/tmp/apt-ostree\
     -v /dev:/dev \
     -v /run:/run \
     -v /sys:/sys \
     -v /var/tmp:/var/tmp \
     pablo-dev
