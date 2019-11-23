# Build:
#  docker build --rm -f Dockerfile -t gramaziokohler/ros-abb-planner .
#
# Usage:
#  docker pull gramaziokohler/ros-abb-planner

FROM gramaziokohler/ros-base:19.11
LABEL maintainer "Gonzalo Casas <casas@arch.ethz.ch>"

SHELL ["/bin/bash","-c"]

# Install packages
RUN apt-get update && apt-get install -y \
    # ROS MoveIt
    ros-${ROS_DISTRO}-moveit \
    --no-install-recommends \
    # Clear apt-cache to reduce image size
    && rm -rf /var/lib/apt/lists/*

ENV CATKIN_WS=/root/catkin_ws
RUN mkdir -p $CATKIN_WS/src

# Add robot packages to local catkin workspace
RUN source /opt/ros/${ROS_DISTRO}/setup.bash \
    # Update apt-get because its cache is always cleared after installs to keep image size down
    && apt-get update \
    # ABB packages
    && git clone -b ${ROS_DISTRO}-devel https://github.com/ros-industrial/abb.git \
    && git clone -b ${ROS_DISTRO}-devel https://github.com/ros-industrial/abb_experimental.git \
    # Install dependencies
    && cd $CATKIN_WS \
    && rosdep install -y --from-paths . --ignore-src --rosdistro ${ROS_DISTRO} \
    # Build catkin workspace
    && catkin_make
