# Build:
#  docker build --rm -f Dockerfile --build-arg FROM_IMAGE_TAG=${TAG} -t gramaziokohler/ros-noetic-dfab:${TAG} .
#
# Usage:
#  docker pull gramaziokohler/ros-noetic-dfab

ARG FROM_IMAGE_TAG

FROM gramaziokohler/ros-noetic-moveit:${FROM_IMAGE_TAG}
LABEL maintainer "Gonzalo Casas <casas@arch.ethz.ch>"

SHELL ["/bin/bash","-c"]

ENV CATKIN_WS=/root/catkin_ws
ENV DEBIAN_FRONTEND=noninteractive

RUN echo "Building RRC" \
    && source /opt/ros/${ROS_DISTRO}/setup.bash \
    && apt-get update && apt-get -y upgrade \
    # RRC packages
    && apt install python3-requests \
    && git clone https://github.com/compas-rrc/compas_rrc_ros.git \
    # Install dependencies
    && cd $CATKIN_WS \
    # Build catkin workspace
    && catkin_make \
    && rm -rf /var/lib/apt/lists/*
