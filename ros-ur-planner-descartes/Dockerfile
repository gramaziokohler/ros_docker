# Build:
#  docker build --rm -f Dockerfile -t gramaziokohler/ros-ur-planner-descartes .
#
# Usage:
#  docker pull gramaziokohler/ros-ur-planner-descartes

FROM ros:melodic
LABEL maintainer "Gonzalo Casas <casas@arch.ethz.ch>"

SHELL ["/bin/bash","-c"]

# Install packages
# Note: --fix-missing is run to fix an issue with an outdated ros-melodic-rviz-visual-tools
RUN apt-get -qq update --fix-missing && apt-get install -y \
    # Basic utilities
    iputils-ping \
    # ROS bridge server and related packages
    ros-${ROS_DISTRO}-rosbridge-server \
    ros-${ROS_DISTRO}-tf2-web-republisher \
    --no-install-recommends \
    # Clear apt-cache to reduce image size
    && rm -rf /var/lib/apt/lists/*

# Create local catkin workspace
ENV CATKIN_WS=/root/catkin_ws
RUN mkdir -p $CATKIN_WS/src
WORKDIR $CATKIN_WS/src

# Initialize local catkin workspace
RUN source /opt/ros/${ROS_DISTRO}/setup.bash \
    # Update apt-get because its cache is always cleared after installs to keep image size down
    && apt-get update \
    # ROS File Server
    && git clone https://github.com/gramaziokohler/ros_file_server.git \
    # Descartes planner & capability for MoveIt!
    && git clone -b melodic-collision-minimum https://github.com/PickNikRobotics/descartes.git \
    && git clone https://github.com/PickNikRobotics/descartes_capability.git \
    # UR packages
    && git clone -b kinetic-devel https://github.com/ros-industrial/universal_robot.git \
    && git clone -b kinetic-devel https://github.com/ros-industrial/ur_modern_driver.git \
    # Install dependencies
    && cd $CATKIN_WS \
    && rosdep install -y --from-paths . --ignore-src --rosdistro ${ROS_DISTRO} \
    # Build catkin workspace
    && catkin_make


COPY ./ros_catkin_entrypoint.sh /
ENTRYPOINT ["/ros_catkin_entrypoint.sh"]
CMD ["bash"]
