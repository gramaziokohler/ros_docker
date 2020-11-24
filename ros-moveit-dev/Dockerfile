# Build:
#  docker build --rm -f Dockerfile -t gramaziokohler/ros-moveit-dev .
#
# Usage:
#  docker pull gramaziokohler/ros-moveit-dev

FROM gramaziokohler/ros-moveit
LABEL maintainer "Gonzalo Casas <casas@arch.ethz.ch>"

SHELL ["/bin/bash","-c"]

COPY ./catkin_make.sh $CATKIN_WS
RUN chmod +x $CATKIN_WS/catkin_make.sh

WORKDIR $CATKIN_WS
ENTRYPOINT ["/root/catkin_ws/catkin_make.sh"]

# Update apt-get otherwise installing anything afterwards is super slow
RUN apt-get update
