#!/bin/bash

echo "==> Executing image entrypoint ..."
echo "-> Setting up ROS"
source "/opt/ros/$ROS_DISTRO/setup.bash"

echo "-> Setting up catkin workspace"
source "$CATKIN_WS/devel/setup.bash"

echo "==> Container ready"
exec "$@"
