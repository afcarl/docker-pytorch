#!/bin/bash

workdef=/work
datadef=/data1
test -d /nfs/work/. && workdef=/nfs/work
work=${workdir:-$workdef}
data=${datadir:-$datadef}
echo /work=$work
echo /here=$(pwd)

set -a
DUSER=$(id)
DUID=$(id -u)
DGID=$(id -g)
SHELL=/bin/bash
set +a

nvidia-docker run \
    -t -i \
    --init \
    -e "HOSTNAME=$(hostname)" \
    -e DISPLAY=$DISPLAY \
    -e DUSER=$DUSER \
    -e DUID=$DUID \
    -e DGID=$DGID \
    -e SHELL=$SHELL\
    -v /etc/ssh:/etc/ssh \
    -v $work:/work \
    -v $data:/data \
    -v $(/bin/pwd):/here \
    -w /here \
    -p 8988:8888 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/.Xauthority:/root/.Xauthority \
    docker-pytorch \
    /usr/local/bin/run.sh "$@"
