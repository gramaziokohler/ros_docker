# Build:
#  docker build --rm -f Dockerfile -t gramaziokohler/ros-kinetic-dfab .
#
# Usage:
#  docker pull gramaziokohler/ros-kinetic-dfab

FROM gramaziokohler/ros-kinetic-moveit
LABEL maintainer "Gonzalo Casas <casas@arch.ethz.ch>"

SHELL ["/bin/bash","-c"]

ENV CATKIN_WS=/root/catkin_ws
ENV DEBIAN_FRONTEND=noninteractive

RUN echo "Building RRC" \
    && source /opt/ros/${ROS_DISTRO}/setup.bash \
    && apt-get update && apt-get -y upgrade \
    # RRC packages
    && git clone https://github.com/compas-rrc/compas_rrc_ros.git \
    # Install dependencies
    && cd $CATKIN_WS \
    # Build catkin workspace
    && catkin_make \
    && rm -rf /var/lib/apt/lists/*
