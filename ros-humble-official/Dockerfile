ARG UID=1000
ARG GID=1000
ARG USER_NAME=docker
ARG BUILD_WITH_CUDA=OFF

FROM ros:humble

ARG BUILD_WITH_CUDA
ARG UID
ARG GID
ARG USER_NAME

SHELL ["/bin/bash", "-c"]

WORKDIR /home/setup

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
    tzdata \
    && rm -rf /var/lib/apt/lists/*
ENV TZ=Asia/Tokyo

RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo \
    nano \
    iputils-ping \
    net-tools \
    iproute2 \
    traceroute \
    zip \
    unzip \
    psmisc \
    wget \
    git \
    cmake \
    software-properties-common \
    python3-pip \
    python3-serial \
    python3-pykdl \
    python3-smbus \
    python3-tqdm \
    python3-requests \
    udev \
    libgeographic-dev \
    libqt5svg5-dev \
    terminator \
    i2c-tools \
    libapr1-dev \
    && rm -rf /var/lib/apt/lists/*

COPY /setup/setup-cuda.sh ./
RUN if [ ${BUILD_WITH_CUDA} = ON ] ; \
    then \
        ./setup-cuda.sh ; \
    fi

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-humble-desktop \
    ros-dev-tools \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-humble-rosbag2-storage-mcap \
    ros-humble-rqt-tf-tree \
    ros-humble-rqt-robot-steering \
    ros-humble-xacro \
    # ros-humble-gazebo-ros-pkgs \
    ros-humble-camera-info-manager \
    ros-humble-launch-pytest \
    ros-humble-joint-state-publisher-gui \
    ros-humble-joy-linux \
    ros-humble-joy-linux-dbgsym \
    ros-humble-imu-tools \
    ros-humble-image-transport \
    ros-humble-image-transport-plugins \
    ros-humble-pointcloud-to-laserscan \
    ros-humble-depthimage-to-laserscan \
    ros-humble-geographic-msgs \
    ros-humble-geometry2 \
    ros-humble-tf2-geometry-msgs \
    ros-humble-plotjuggler-ros \
    && rm -rf /var/lib/apt/lists/*

# gazebo-ros-pkgs
RUN if [ $(uname -m) = 'x86_64' ] ; \
    then \
        apt-get update && apt-get install -y --no-install-recommends \
        ros-humble-gazebo-ros-pkgs \
        && rm -rf /var/lib/apt/lists/* ; \
    else \
        echo "not install ros-humble-gazebo-ros-pkgs" ; \
    fi

# navigation2
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-humble-behaviortree-cpp-v3 \
    ros-humble-test-msgs \
    ros-humble-ompl \
    nlohmann-json3-dev \
    ros-humble-bondcpp \
    ros-humble-bond \
    lcov \
    python3-zmq \
    libgraphicsmagick++1-dev \
    graphicsmagick-libmagick-dev-compat \
    libxtensor-dev \
    libomp-dev \
    libbenchmark-dev \
    libceres-dev \
    && rm -rf /var/lib/apt/lists/*

# rtabmap
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-humble-libg2o \
    ros-humble-gtsam \
    ros-humble-libpointmatcher \
    ros-humble-octomap \
    # ros-humble-grid-map-core \
    # ros-humble-grid-map-ros \
    ros-humble-pcl-ros \
    ros-humble-velodyne \
    ros-humble-octomap-msgs \
    && rm -rf /var/lib/apt/lists/*

# Groot
RUN apt-get update && apt-get install -y --no-install-recommends \
    libdw-dev \
    && rm -rf /var/lib/apt/lists/*

# ublox
RUN apt-get update && apt-get install -y --no-install-recommends \
    libasio-dev \
    ros-humble-nmea-msgs \
    ros-humble-rtcm-msgs \
    && rm -rf /var/lib/apt/lists/*

# librealsense2
COPY /setup/setup-librealsense.sh ./
RUN if [ ${BUILD_WITH_CUDA} = ON ] ; \
    then \
        ./setup-librealsense.sh ; \
    fi
RUN if [ ${BUILD_WITH_CUDA} = OFF ] ; \
    then \
        apt-get update && apt-get install -y --no-install-recommends \
        ros-humble-librealsense2 \
        && rm -rf /var/lib/apt/lists/* ; \
    fi

# livox-sdk2
COPY /setup/setup-livox-sdk.sh ./
RUN ./setup-livox-sdk.sh

# pip
RUN pip install mcap-ros2-support
RUN pip install fiona
RUN pip install pandas
RUN pip install geopandas

RUN pip install setuptools==58.2.0

#RUN apt-get upgrade

RUN groupadd -g ${GID} ${USER_NAME}
RUN useradd -m -u ${UID} -g ${GID} ${USER_NAME}
RUN echo "${USER_NAME}:${USER_NAME}" | chpasswd
RUN adduser ${USER_NAME} sudo

# RUN echo "${USER_NAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN echo "${USER_NAME} ALL=(ALL:ALL) ALL" > /etc/sudoers.d/${USER_NAME} && chmod 0440 /etc/sudoers.d/${USER_NAME}

RUN usermod -a -G audio ${USER_NAME}
RUN usermod -a -G dialout ${USER_NAME}
RUN usermod -a -G video ${USER_NAME}
RUN usermod -a -G i2c ${USER_NAME}

USER ${USER_NAME}

WORKDIR /home/${USER_NAME}

RUN if [ ${BUILD_WITH_CUDA} = ON ] ; \
    then \
      echo 'export PATH=/usr/local/cuda/bin:${PATH}' >> ~/.bashrc ; \
      echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}' >> ~/.bashrc ; \
    fi

RUN echo 'source /opt/ros/humble/setup.bash' >> ~/.bashrc
RUN source ~/.bashrc
