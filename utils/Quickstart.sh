#!/usr/bin/env bash

sudo docker run --rm -it \
    -p 5900:5900 \
    -p 6080:6080 \
    -p 29999:29999 \
    -p 30000:30000 \
    -p 30001:30001 \
    -e ROBOT_MODEL=UR10 \
    universalrobots/ursim_e-series:5.12.5
