# Build:
#  docker build --rm -f Dockerfile -t gramaziokohler/ros-kuka-iiwa-planner .
#
# Usage:
#  docker pull gramaziokohler/ros-kuka-iiwa-planner

FROM gramaziokohler/ros-moveit
LABEL maintainer "Gonzalo Casas <casas@arch.ethz.ch>"

SHELL ["/bin/bash","-c"]
ENV CATKIN_WS=/root/catkin_ws
RUN mkdir -p $CATKIN_WS/src

# Copy a demo launch file that does not namespace robots
# otherwise all default examples need tweaking to the default `iiwa` namespace
COPY ./demo-iiwa.launch /

# Add robot packages to local catkin workspace
RUN echo "Building IIWA Stack Planner for ROS" \
    && source /opt/ros/${ROS_DISTRO}/setup.bash \
    # Update apt-get because its cache is always cleared after installs to keep image size down
    && apt-get update && apt-get -y upgrade \
    # IIWA Stack packages
    && git clone https://github.com/IFL-CAMP/iiwa_stack.git \
    # Install dependencies
    && cd $CATKIN_WS \
    && rosdep install -y --from-paths . --ignore-src --rosdistro ${ROS_DISTRO} \
    # Build catkin workspace
    && catkin_make \
    # Clear apt-cache to reduce image size
    && rm -rf /var/lib/apt/lists/*
