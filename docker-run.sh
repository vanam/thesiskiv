#!/usr/bin/env bash

DIR=$(pwd)

docker run -v $DIR:/home -w /home/src -it vanam/texlive-2018 /bin/bash
