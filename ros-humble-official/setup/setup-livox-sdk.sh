#!/bin/bash

CURRENT_DIR=`pwd`

cd `dirname $0`
SCRIPTS_DIR=`pwd`
DIR=`dirname ${SCRIPTS_DIR}`

cd ${SCRIPTS_DIR}
mkdir -p ${SCRIPTS_DIR}/livox-sdk
cd ${SCRIPTS_DIR}/livox-sdk

sudo apt update && sudo apt install -y cmake && rm -rf /var/lib/apt/lists/*

git clone https://github.com/Livox-SDK/Livox-SDK2.git
cd ${SCRIPTS_DIR}/livox-sdk/Livox-SDK2
git checkout v1.2.5

mkdir build
cd build
cmake .. && make -j
sudo make install
