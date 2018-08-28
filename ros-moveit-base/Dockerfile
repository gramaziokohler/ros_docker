FROM osrf/ros:kinetic-desktop-full-xenial

SHELL ["/bin/bash","-c"]

# Install ROS packages
RUN apt-get update && apt-get install -y \
    ros-kinetic-catkin \
    python-catkin-tools \
    ros-kinetic-moveit \
    ros-kinetic-joy \
    && rm -rf /var/lib/apt/lists/

# Create local catkin workshop
RUN mkdir -p /catkin_ws/src

# Setup MoveIt tutorials
RUN apt-get update && apt-get install -y \
    ros-kinetic-franka-description && \
    cd /catkin_ws/src && \
    git clone https://github.com/ros-planning/moveit_tutorials.git && \
    git clone https://github.com/ros-planning/panda_moveit_config.git


# Initialize local catkin workspace
RUN source /opt/ros/kinetic/setup.bash && \
    cd /catkin_ws && \
    rosdep install -y --from-paths . --ignore-src --rosdistro kinetic && \
    catkin_make

COPY ./ros_catkin_entrypoint.sh /

ENTRYPOINT ["/ros_catkin_entrypoint.sh"]
CMD ["bash"]
