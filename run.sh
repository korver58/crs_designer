#!/bin/bash
docker run \
    --rm -it \
    --volume=$HOME:/home/$USER \
    --volume=$(pwd)/commonroad-scenario-designer:$HOME/commonroad-scenario-designer \
    --privileged \
    --net=host \
    --env="DISPLAY=${DISPLAY}" \
    --env="HOSTIP=${HOSTIP}" \
    crs_designer:latest