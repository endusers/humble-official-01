#!/bin/bash

cd ros-humble-official
docker-compose -p rosenv exec $@ ros2-humble-official-01 /bin/bash
