#!/bin/bash

CURRENT_DIR=`pwd`
cd `dirname $0`
SCRIPTS_DIR=`pwd`

cd ros-humble-official
xhost +local:
docker-compose -p rosenv stop $@
xhost -local:
