#!/bin/bash

USE_ENV='nvidia'
while getopts wi- OPT
do
    if [ ${OPT} = w ]
    then
        USE_ENV='wsl'
        break
    elif [ ${OPT} = i ]
    then
        USE_ENV='intel'
        break
    else
        break
    fi
done

shift `expr ${OPTIND} - 1`

cd ros-humble-official

export ROS_DOMAIN_ID=100

if [ ${USE_ENV} = 'intel' ]
then
    xhost +local:
    cp default.intel.docker-compose.yml docker-compose.yml
    docker-compose -p rosenv up -d $@
    xhost -local:
elif [ ${USE_ENV} = 'nvidia' ]
then
    xhost +local:
    cp default.docker-compose.yml docker-compose.yml
    docker-compose -p rosenv up -d $@
    xhost -local:
else
    xhost +local:
    export DISPLAY=$(route.exe print | grep 0.0.0.0 | head -1 | awk '{print $4}'):0
    cp default.wsl.docker-compose.yml docker-compose.yml
    docker-compose -p rosenv up -d $@
    xhost -local:
fi
