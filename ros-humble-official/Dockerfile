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
    udev \
    libgeographic-dev \
    libqt5svg5-dev

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-humble-rosbag2-storage-mcap \
    ros-humble-rqt-tf-tree \
    ros-humble-rqt-robot-steering \
    ros-humble-xacro \
    ros-humble-gazebo-ros-pkgs \
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

# nav2
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-humble-test-msgs \
    ros-humble-behaviortree-cpp-v3 \
    ros-humble-ompl \
    ros-humble-nav2-msgs \
    ros-humble-bond \
    ros-humble-bondcpp \
    ros-humble-smclib

# nav2
RUN apt-get update && apt-get install -y --no-install-recommends \
    libxtensor-dev \
    nlohmann-json3-dev \
    xtl-dev \
    libomp-14-dev \
    libomp-dev \
    libomp5-14 \
    libbenchmark-dev \
    libbenchmark1 \
    bzip2-doc \
    fonts-droid-fallback \
    fonts-noto-mono \
    fonts-urw-base35 \
    ghostscript \
    gsfonts \
    libbz2-dev \
    libgraphicsmagick++-q16-12 \
    libgraphicsmagick++1-dev \
    libgraphicsmagick-q16-3 \
    libgraphicsmagick1-dev \
    libgs9 \
    libgs9-common \
    libidn12 \
    libijs-0.35 \
    libjbig2dec0 \
    liblcms2-dev \
    libpaper-utils \
    libpaper1 \
    libwmf-0.2-7 \
    libwmf-dev \
    libwmflite-0.2-7 \
    poppler-data \
    graphicsmagick-libmagick-dev-compat \
    libgraphics-magick-perl \
    lcov \
    libcommon-sense-perl \
    libgd-perl \
    libjson-perl \
    libjson-xs-perl \
    libperlio-gzip-perl \
    libtypes-serialiser-perl \
    python3-zmq \
    libamd2 \
    libbtf1 \
    libcamd2 \
    libccolamd2 \
    libcholmod3 \
    libcolamd2 \
    libcxsparse3 \
    libgraphblas-dev \
    libgraphblas6 \
    libklu1 \
    libldl2 \
    libmetis5 \
    libmongoose2 \
    librbio2 \
    libsliplu1 \
    libspqr2 \
    libsuitesparse-dev \
    libsuitesparseconfig5 \
    libumfpack5 \
    libceres-dev \
    libceres2 \
    libgflags-dev \
    libgflags2.2 \
    libgoogle-glog-dev \
    libgoogle-glog0v5 \
    libunwind-dev

# ublox
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-humble-nmea-msgs \
    ros-humble-rtcm-msgs

# ublox
RUN apt-get update && apt-get install -y --no-install-recommends \
    libasio-dev \
    i2c-tools \
    libi2c0 \
    libx86-1 \
    read-edid \
    systemd-hwe-hwdb

# realsense
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-humble-librealsense2

RUN pip install mcap-ros2-support
RUN pip install geopandas
RUN pip install pandas

RUN pip install setuptools==58.2.0

#RUN apt-get upgrade

RUN useradd -m docker
RUN echo "docker:docker" | chpasswd
RUN adduser docker sudo

RUN usermod -a -G audio docker

USER docker

WORKDIR /home/docker

RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
RUN source ~/.bashrc
