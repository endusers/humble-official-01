#!/bin/bash

CURRENT_DIR=`pwd`
cd `dirname $0`
SCRIPTS_DIR=`pwd`

cd ros-humble-official
docker-compose -p rosenv exec $@ ros2-humble-official-01 /bin/bash
