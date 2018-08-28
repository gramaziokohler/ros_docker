#!/bin/bash
set -e

# Source ROS distro environment and local catwin workspace
source "/opt/ros/kinetic/setup.bash" && source "/catkin_ws/devel/setup.bash"

exec "$@"
