#!/bin/bash

CURRENT_DIR=`pwd`

cd `dirname $0`
SCRIPTS_DIR=`pwd`
DIR=`dirname ${SCRIPTS_DIR}`

cd ${SCRIPTS_DIR}
mkdir -p ${SCRIPTS_DIR}/cuda
cd ${SCRIPTS_DIR}/cuda

if [ $(uname -m) = 'x86_64' ]
    then
        # 12.2.1
        wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
        sudo dpkg -i cuda-keyring_1.1-1_all.deb
        sudo apt update && sudo apt install -y cuda-toolkit-12-2 && rm -rf /var/lib/apt/lists/*
    fi

if [ $(uname -m) = 'aarch64' ] || [ $(uname -m) = 'arm64' ]
    then
        # 12.2.1
        wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/arm64/cuda-keyring_1.1-1_all.deb
        sudo dpkg -i cuda-keyring_1.1-1_all.deb
        sudo apt update && sudo apt install -y cuda-toolkit-12-2 && rm -rf /var/lib/apt/lists/*
        # # 12.4.0
        # wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/arm64/cuda-keyring_1.1-1_all.deb
        # sudo dpkg -i cuda-keyring_1.1-1_all.deb
        # sudo apt update && sudo apt install -y cuda-toolkit-12-4 && rm -rf /var/lib/apt/lists/*
        # sudo apt update && sudo apt install -y cuda-toolkit-12-4 cuda-compat-12-4 && rm -rf /var/lib/apt/lists/*
    fi
