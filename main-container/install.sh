#!/usr/bin/env bash

podman build -t build-main .
toolbox create -c main --image localhost/build-main
