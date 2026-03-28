#!/bin/bash

CURRENT_DIR=`pwd`

cd `dirname $0`
SCRIPTS_DIR=`pwd`
DIR=`dirname ${SCRIPTS_DIR}`

cd ${SCRIPTS_DIR}
mkdir -p ${SCRIPTS_DIR}/librealsense
cd ${SCRIPTS_DIR}/librealsense

cd ${SCRIPTS_DIR}/librealsense
git clone https://github.com/IntelRealSense/librealsense.git
cd ${SCRIPTS_DIR}/librealsense/librealsense
# git checkout v2.56.3
git checkout v2.57.7

sudo cp config/99-realsense-libusb.rules /etc/udev/rules.d/ 
sudo cp config/99-realsense-d4xx-mipi-dfu.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
sudo udevadm trigger
mkdir build && cd build

export PATH=/usr/local/cuda/bin:${PATH}
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}

if [ $(uname -m) = 'x86_64' ]
    then
        cmake ../ -DFORCE_RSUSB_BACKEND=false -DCMAKE_BUILD_TYPE=release -DBUILD_WITH_CUDA=true
    fi

if [ $(uname -m) = 'aarch64' ] || [ $(uname -m) = 'arm64' ]
    then
        cmake ../ -DFORCE_RSUSB_BACKEND=true -DCMAKE_BUILD_TYPE=release -DBUILD_WITH_CUDA=true
    fi

sudo make install
