# Build:
#  docker build --rm -f Dockerfile -t gramaziokohler/ros-kinetic-moveit .
#
# Usage:
#  docker pull gramaziokohler/ros-kinetic-moveit

FROM gramaziokohler/ros-kinetic-base
LABEL maintainer "Gonzalo Casas <casas@arch.ethz.ch>"

SHELL ["/bin/bash","-c"]

ENV CATKIN_WS=/root/catkin_ws

# All apt-get commands start with an update, then install
# and finally, a cache cleanup to keep the image size small.

# MoveIt
RUN echo "Install MoveIt" \
    && source /opt/ros/${ROS_DISTRO}/setup.bash \
    && apt-get update && apt-get -y upgrade \
    # ROS MoveIt
    && apt-get install -y ros-${ROS_DISTRO}-moveit --no-install-recommends \    
    && rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND=noninteractive

# Add robot packages to local catkin workspace
RUN echo "Building common MoveIt Planners" \
    && source /opt/ros/${ROS_DISTRO}/setup.bash \
    && apt-get update && apt-get -y upgrade \
    # UR packages
    && git clone -b kinetic-devel https://github.com/ros-industrial/universal_robot.git \
    # ABB packages (abb_driver only included because some other packages reference it, but we don't use it)
    && git clone https://github.com/ros-industrial/abb.git \
    && git clone https://github.com/ros-industrial/abb_experimental.git \
    && git clone https://github.com/gramaziokohler/abb_irb4600_40_255.git \
    && git clone https://github.com/gramaziokohler/abb_irb4600_40_255_moveit_config.git \
    && git clone https://github.com/gramaziokohler/abb_irb4600_60_205.git \
    && git clone https://github.com/gramaziokohler/abb_irb4600_60_205_moveit_config.git \
    && git clone https://github.com/gramaziokohler/rfl_description.git \
    # Panda packages
    && git clone -b kinetic-devel https://github.com/ros-planning/moveit_tutorials.git \
    && git clone -b kinetic-devel https://github.com/ros-planning/panda_moveit_config.git \
    # Install dependencies
    && cd $CATKIN_WS \
    && rosdep install -y --from-paths . --ignore-src --skip-keys="abb_driver gazebo" --rosdistro ${ROS_DISTRO} \
    # Build catkin workspace
    && catkin_make \
    && rm -rf /var/lib/apt/lists/*

ADD launch /root/catkin_ws/launch
