#!/bin/bash

CURRENT_DIR=`pwd`

cd `dirname $0`
SCRIPTS_DIR=`pwd`
DIR=`dirname ${SCRIPTS_DIR}`

cd ${SCRIPTS_DIR}
mkdir -p ${SCRIPTS_DIR}/rgl-gazebo-plugin
cd ${SCRIPTS_DIR}/rgl-gazebo-plugin

wget https://github.com/RobotecAI/RGLGazeboPlugin/releases/download/v0.2.0-harmonic/RGLGazeboPlugin_ubuntu22.zip
unzip ./RGLGazeboPlugin_ubuntu22.zip

sudo cp ./RGLServerPlugin/libRobotecGPULidar.so /usr/lib/x86_64-linux-gnu/gz-sim-8/plugins
sudo cp ./RGLServerPlugin/libRGLServerPluginInstance.so /usr/lib/x86_64-linux-gnu/gz-sim-8/plugins
sudo cp ./RGLServerPlugin/libRGLServerPluginManager.so /usr/lib/x86_64-linux-gnu/gz-sim-8/plugins
sudo cp ./RGLVisualize/libRGLVisualize.so /usr/lib/x86_64-linux-gnu/gz-sim-8/plugins/gui
