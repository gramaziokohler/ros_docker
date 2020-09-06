# Build:
#  docker build --rm -f Dockerfile -t gramaziokohler/ros-moveit .
#
# Usage:
#  docker pull gramaziokohler/ros-moveit

FROM gramaziokohler/ros-base:latest
LABEL maintainer "Gonzalo Casas <casas@arch.ethz.ch>"

SHELL ["/bin/bash","-c"]

# Install packages
RUN apt-get update && apt-get install -y \
    # ROS MoveIt
    ros-${ROS_DISTRO}-moveit \
    --no-install-recommends \
    # Clear apt-cache to reduce image size
    && rm -rf /var/lib/apt/lists/*
