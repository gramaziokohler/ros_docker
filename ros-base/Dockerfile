FROM ros:kinetic-robot-xenial

SHELL ["/bin/bash","-c"]

# Install ROS packages
RUN apt-get update && apt-get install -y \
    ros-kinetic-rosbridge-server \
    ros-kinetic-tf2-web-republisher \
    ros-kinetic-ros-tutorials \
    ros-kinetic-common-tutorials \
    && rm -rf /var/lib/apt/lists/

# Create local catkin workshop
RUN mkdir -p /catkin_ws/src

# Setup ROS File Server
RUN cd /catkin_ws/src && \
    git clone https://github.com/gramaziokohler/ros_file_server.git

# Initialize local catkin workspace
RUN source /opt/ros/kinetic/setup.bash && \
    cd /catkin_ws && \
    rosdep install -y --from-paths . --ignore-src --rosdistro kinetic && \
    catkin_make

COPY ./ros_catkin_entrypoint.sh /

ENTRYPOINT ["/ros_catkin_entrypoint.sh"]
CMD ["bash"]
