FROM ros:humble

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-humble-desktop=0.10.0-1* \
    && rm -rf /var/lib/apt/lists/*

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
    i2c-tools

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
    ros-humble-tf2-geometry-msgs

# gazebo-ros-pkgs
RUN if [ $(uname -m) = "x86_64" ] ; \
    then \
        apt-get update && apt-get install -y --no-install-recommends \
        ros-humble-gazebo-ros-pkgs; \
    else \
        echo "not install ros-humble-gazebo-ros-pkgs"; \
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
    libceres-dev

# rtabmap
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-humble-libg2o \
    ros-humble-gtsam \
    ros-humble-libpointmatcher \
    ros-humble-octomap \
    ros-humble-grid-map-core \
    ros-humble-pcl-ros \
    ros-humble-velodyne \
    ros-humble-octomap-msgs \
    ros-humble-grid-map-ros

# Groot
RUN apt-get update && apt-get install -y --no-install-recommends \
    libdw-dev

# ublox
RUN apt-get update && apt-get install -y --no-install-recommends \
    libasio-dev \
    ros-humble-nmea-msgs \
    ros-humble-rtcm-msgs

# realsense-ros
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-humble-librealsense2

RUN pip install mcap-ros2-support
RUN pip install fiona
RUN pip install pandas
RUN pip install geopandas

RUN pip install setuptools==58.2.0

#RUN apt-get upgrade

RUN useradd -m docker
RUN echo "docker:docker" | chpasswd
RUN adduser docker sudo

RUN usermod -a -G audio docker
RUN usermod -a -G dialout docker
RUN usermod -a -G i2c docker

USER docker

WORKDIR /home/docker

RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
RUN source ~/.bashrc
