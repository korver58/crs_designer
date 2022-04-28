#!/bin/sh
docker build \
    --network host \
    -t crs_designer \
    -f Dockerfile . "$@"