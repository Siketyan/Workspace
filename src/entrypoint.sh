#!/bin/bash

mkdir -p /home/workspace/projects
/usr/local/src/code-server/code-server \
    --host 0.0.0.0 \
    --auth none \
    --disable-ssh \
    --port $CODE_SERVER_PORT \
    /home/workspace/projects
