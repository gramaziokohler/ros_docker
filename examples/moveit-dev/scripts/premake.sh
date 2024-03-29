# Use this file to run additional tasks before the catkin_make command is triggered
# e.g. updating dependencies
# If no pre-make tasks are required, the file can be deleted. 

cd $CATKIN_WS/src
if [ ! -d "$CATKIN_WS/src/ros_file_server" ]; then
  git clone https://github.com/gramaziokohler/ros_file_server.git
fi
if [ ! -d "$CATKIN_WS/src/universal_robot" ]; then
  git clone -b ${ROS_DISTRO}-devel https://github.com/ros-industrial/universal_robot.git
fi

# Fix ros apt-key to prevent apt-install errors.
# Note: See https://github.com/osrf/docker_images/issues/535#issuecomment-851505821
# NOTE: Needed because of this bug https://github.com/osrf/docker_images/issues/535
apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# update apt sources to apply the fix
apt-get update

# Install dependencies
apt-get install -y ros-${ROS_DISTRO}-joint-state-publisher ros-${ROS_DISTRO}-industrial-core
