# ROS Docker files

> ROS Noetic images: a containerized version of various ROS nodes.

This repository provides `Dockerfile` files to run [ROS](https://ros.org) inside [Docker](https://www.docker.com/) containers:


## Base ROS Noetic image

[![](https://img.shields.io/docker/v/gramaziokohler/ros-noetic-base?sort=date)](https://hub.docker.com/r/gramaziokohler/ros-noetic-base)
[![](https://img.shields.io/docker/image-size/gramaziokohler/ros-noetic-base?sort=date)](https://microbadger.com/images/gramaziokohler/ros-noetic-base)

    $ docker pull gramaziokohler/ros-noetic-base

Contains ROS and tools to use it over websockets with `rosbridge-suite`.

## ROS Noetic + MoveIt!

[![](https://img.shields.io/docker/v/gramaziokohler/ros-noetic-moveit?sort=date)](https://hub.docker.com/r/gramaziokohler/ros-noetic-moveit)
[![](https://img.shields.io/docker/image-size/gramaziokohler/ros-noetic-moveit?sort=date)](https://microbadger.com/images/gramaziokohler/ros-noetic-moveit)

    $ docker pull gramaziokohler/ros-noetic-moveit

Contains MoveIt! configured with the packages for ABB, UR and Franke Emika (Panda) robots.

## X11 NoVNC display container

[![](https://img.shields.io/docker/v/gramaziokohler/novnc?sort=date)](https://hub.docker.com/r/gramaziokohler/novnc)
[![](https://img.shields.io/docker/image-size/gramaziokohler/novnc?sort=date)](https://microbadger.com/images/gramaziokohler/novnc)

    $ docker pull gramaziokohler/novnc

Display X11 applications (e.g. `RViz`) from other containers directly in the browser.

## How to use

First, make sure [Docker](https://www.docker.com/) is installed on your system.

### Building the docker images

These images are built and published by Github Actions on every push.
If a push includes a tag, the images will also be tagged with it.

### Using the containers

1. Copy & Paste the following content into a `docker-compose.yml` file in your computer:

    ```yaml
    version: '2'
    services:
      moveit-demo:
        image: gramaziokohler/ros-noetic-moveit
        container_name: moveit-demo
        environment:
          - ROS_HOSTNAME=moveit-demo
          - ROS_MASTER_URI=http://ros-core:11311
        depends_on:
          - ros-core
        command:
          - roslaunch
          - --wait
          - panda_moveit_config
          - demo.launch
          - use_rviz:=false

      ros-core:
        image: gramaziokohler/ros-noetic-moveit
        container_name: ros-core
        ports:
          - "11311:11311"
        command:
          - roscore

      ros-bridge:
        image: gramaziokohler/ros-noetic-moveit
        container_name: ros-bridge
        environment:
          - "ROS_HOSTNAME=ros-bridge"
          - "ROS_MASTER_URI=http://ros-core:11311"
        ports:
          - "9090:9090"
        depends_on:
          - ros-core
        command:
          - roslaunch
          - --wait
          - rosbridge_server
          - rosbridge_websocket.launch

      ros-fileserver:
        image: gramaziokohler/ros-noetic-moveit
        container_name: ros-fileserver
        environment:
          - ROS_HOSTNAME=ros-fileserver
          - ROS_MASTER_URI=http://ros-core:11311
        depends_on:
          - ros-core
        command:
          - roslaunch
          - --wait
          - file_server
          - file_server.launch
    ```

2. Start it all up with:

       $ docker-compose up -d

3. MoveIt is now running headless on our container! Check more examples for accessing RVIZ and other options.

#### More examples

Check the [examples](examples) folder for several examples of `docker-compose` files.

## Notes

These images are maintained by Gramazio Kohler Research
[@gramaziokohler](https://github.com/gramaziokohler>)

They are used by the [COMPAS FAB](https://gramaziokohler.github.io/compas_fab) framework
to provide a [containerized ROS backend for planning and execution](https://gramaziokohler.github.io/compas_fab/latest/backends/ros.html#ros-on-docker-1).

## Credits

These docker images are only possible thanks to the huge contribution of the ROS and ROS-I community. Besides ROS itself, the following open source projects are built and included in them:

- [MoveIt: ROS Motion Planning Framework](https://github.com/ros-planning/moveit)
- [ROS Bridge Suite](https://github.com/RobotWebTools/rosbridge_suite/)
- [ROS Sharp file server](https://github.com/siemens/ros-sharp/tree/master/ROS/file_server)
- [ROS-I ABB & ABB Experimental](https://github.com/ros-industrial/abb)
- [ROS-I UR](https://github.com/ros-industrial/universal_robot)
- [ROS-I UR Modern Driver](https://github.com/ros-industrial/ur_modern_driver)
- [ROS Panda planning](https://github.com/ros-planning/panda_moveit_config)
- [ROS IIWA Stack](https://github.com/IFL-CAMP/iiwa_stack)
- [NoVNC client](https://github.com/novnc/noVNC)
