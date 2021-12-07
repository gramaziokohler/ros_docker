# ROS Kinetic Docker files

The following images are all based on ROS Kinetic:

## Base ROS Kinetic image

[![](https://img.shields.io/docker/v/gramaziokohler/ros-base?sort=date)](https://hub.docker.com/r/gramaziokohler/ros-base)
[![](https://img.shields.io/docker/image-size/gramaziokohler/ros-base?sort=date)](https://microbadger.com/images/gramaziokohler/ros-base)

    $ docker pull gramaziokohler/ros-base

Contains ROS and tools to use it over websockets with `rosbridge-suite`.

## X11 NoVNC display container

[![](https://img.shields.io/docker/v/gramaziokohler/novnc?sort=date)](https://hub.docker.com/r/gramaziokohler/novnc)
[![](https://img.shields.io/docker/image-size/gramaziokohler/novnc?sort=date)](https://microbadger.com/images/gramaziokohler/novnc)

    $ docker pull gramaziokohler/novnc

Display X11 applications (e.g. `RViz`) from other containers directly in the browser.

## ROS + MoveIt! ABB

[![](https://img.shields.io/docker/v/gramaziokohler/ros-abb-planner?sort=date)](https://hub.docker.com/r/gramaziokohler/ros-abb-planner)
[![](https://img.shields.io/docker/image-size/gramaziokohler/ros-abb-planner?sort=date)](https://microbadger.com/images/gramaziokohler/ros-abb-planner)

    $ docker pull gramaziokohler/ros-abb-planner

Contains MoveIt! configured with the ABB packages.

## ROS + MoveIt! Universal Robots

[![](https://img.shields.io/docker/v/gramaziokohler/ros-ur-planner?sort=date)](https://hub.docker.com/r/gramaziokohler/ros-ur-planner)
[![](https://img.shields.io/docker/image-size/gramaziokohler/ros-ur-planner?sort=date)](https://microbadger.com/images/gramaziokohler/ros-ur-planner)

    $ docker pull gramaziokohler/ros-ur-planner

Contains MoveIt! configured with the Universal Robots packages.

## ROS + MoveIt! Franka Emika Panda

[![](https://img.shields.io/docker/v/gramaziokohler/ros-panda-planner?sort=date)](https://hub.docker.com/r/gramaziokohler/ros-panda-planner)
[![](https://img.shields.io/docker/image-size/gramaziokohler/ros-panda-planner?sort=date)](https://microbadger.com/images/gramaziokohler/ros-panda-planner)

    $ docker pull gramaziokohler/ros-panda-planner

Contains MoveIt! configured with the flagship MoveIt! robot: Franka Emika's
Panda.

## ROS + MoveIt! Kuka IIWA

[![](https://img.shields.io/docker/v/gramaziokohler/ros-kuka-iiwa-planner?sort=date)](https://hub.docker.com/r/gramaziokohler/ros-kuka-iiwa-planner)
[![](https://img.shields.io/docker/image-size/gramaziokohler/ros-kuka-iiwa-planner?sort=date)](https://microbadger.com/images/gramaziokohler/ros-kuka-iiwa-planner)

    $ docker pull gramaziokohler/ros-kuka-iiwa-planner

Contains MoveIt! configured with the Kuka IIWA 7 & 14 robots.

## ROS + MoveIt! for development

[![](https://img.shields.io/docker/v/gramaziokohler/ros-moveit-dev?sort=date)](https://hub.docker.com/r/gramaziokohler/ros-moveit-dev)
[![](https://img.shields.io/docker/image-size/gramaziokohler/ros-moveit-dev?sort=date)](https://microbadger.com/images/gramaziokohler/ros-moveit-dev)

    $ docker pull gramaziokohler/ros-moveit-dev

Contains MoveIt! with an empty catkin workspace to be mounted on the host for a fast development cycle.
