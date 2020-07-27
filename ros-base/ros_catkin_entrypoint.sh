#!/bin/bash

# Source ROS distro environment and local catwin workspace
source "/opt/ros/$ROS_DISTRO/setup.bash" && source "$CATKIN_WS/devel/setup.bash"

exec "$@"
