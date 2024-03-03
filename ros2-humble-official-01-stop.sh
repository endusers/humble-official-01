#!/bin/bash

cd ros-humble-official
xhost +local:
docker-compose -p rosenv stop $@
xhost -local:
