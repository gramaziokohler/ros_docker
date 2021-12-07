#!/bin/bash +x

# Source ROS distro environment and local catkin workspace
source "/opt/ros/$ROS_DISTRO/setup.bash" && source "$CATKIN_WS/devel/setup.bash"

# Run pre-build file if present
if [ -x $CATKIN_WS/scripts/premake.sh ]; then
  $CATKIN_WS/scripts/premake.sh
else
  echo "No premake.sh file found."
fi

# Build local catkin workspace
cd $CATKIN_WS
catkin_make

exec "$@"
