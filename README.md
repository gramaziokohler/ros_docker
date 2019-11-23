# ROS Docker files

> ROS-in-a-box: a containerized version of various ROS nodes.

This repository provides `Dockerfile` files to run [ROS](https://ros.org) inside [Docker](https://www.docker.com/) containers:

## Base ROS image

[![](https://images.microbadger.com/badges/version/gramaziokohler/ros-base.svg)](https://hub.docker.com/r/gramaziokohler/ros-base)
[![](https://images.microbadger.com/badges/image/gramaziokohler/ros-base.svg)](https://microbadger.com/images/gramaziokohler/ros-base)

    $ docker pull gramaziokohler/ros-base

Contains ROS and tools to use it over websockers with `rosbridge-suite`.

## X11 NoVNC display container

[![](https://images.microbadger.com/badges/version/gramaziokohler/novnc.svg)](https://hub.docker.com/r/gramaziokohler/novnc)
[![](https://images.microbadger.com/badges/image/gramaziokohler/novnc.svg)](https://microbadger.com/images/gramaziokohler/novnc)

    $ docker pull gramaziokohler/novnc

Display X11 applications (e.g. `RViz`) from other containers directly in the browser.

## ROS + MoveIt! ABB

[![](https://images.microbadger.com/badges/version/gramaziokohler/ros-abb-planner.svg)](https://hub.docker.com/r/gramaziokohler/ros-abb-planner)
[![](https://images.microbadger.com/badges/image/gramaziokohler/ros-abb-planner.svg)](https://microbadger.com/images/gramaziokohler/ros-abb-planner)

    $ docker pull gramaziokohler/ros-abb-planner

Contains MoveIt! configured with the ABB packages.

## ROS + MoveIt! Universal Robots

[![](https://images.microbadger.com/badges/version/gramaziokohler/ros-ur-planner.svg)](https://hub.docker.com/r/gramaziokohler/ros-ur-planner)
[![](https://images.microbadger.com/badges/image/gramaziokohler/ros-ur-planner.svg)](https://microbadger.com/images/gramaziokohler/ros-ur-planner)

    $ docker pull gramaziokohler/ros-ur-planner

Contains MoveIt! configured with the Universal Robots packages.

## ROS + MoveIt! Franka Emika Panda

[![](https://images.microbadger.com/badges/version/gramaziokohler/ros-panda-planner.svg)](https://hub.docker.com/r/gramaziokohler/ros-panda-planner)
[![](https://images.microbadger.com/badges/image/gramaziokohler/ros-panda-planner.svg)](https://microbadger.com/images/gramaziokohler/ros-panda-planner)

    $ docker pull gramaziokohler/ros-panda-planner

Contains MoveIt! configured with the flagship MoveIt! robot: Franka Emika's
Panda.

## How to use

First, make sure [Docker](https://www.docker.com/) is installed on your system.

### Building the docker images

These images are build on Windows using WSL. The process is straight-forward:

Open your bash shell in WSL and type:

    $ make build

### Publishing the docker images

Once built, you can release all images to Docker Hub in one command:

    $ make release

### Using the containers

#### Web UI example

1. Copy & Paste the following content into a `docker-compose.yml` file in your computer:

    ```yaml
    version: '2'
    services:
      ros-master:
        image: gramaziokohler/ros-base:19.11
        container_name: ros-master
        ports:
          - "11311:11311"
        command:
          - roscore

      ros-bridge:
        image: gramaziokohler/ros-panda-planner:19.11
        container_name: ros-bridge
        environment:
          - "ROS_HOSTNAME=ros-bridge"
          - "ROS_MASTER_URI=http://ros-master:11311"
        ports:
          - "9090:9090"
        depends_on:
          - ros-master
        command:
          - roslaunch
          - --wait
          - rosbridge_server
          - rosbridge_websocket.launch

      panda-demo:
        image: gramaziokohler/ros-panda-planner:19.11
        container_name: panda-demo
        environment:
          - ROS_HOSTNAME=panda-demo
          - ROS_MASTER_URI=http://ros-master:11311
          - DISPLAY=gui:0.0
        depends_on:
          - ros-master
          - gui
        command:
          - roslaunch
          - --wait
          - panda_moveit_config
          - demo.launch

      gui:
        image: gramaziokohler/novnc:latest
        ports:
          - "8080:8080"
    ```

2. Start it all up with:

       $ docker-compose up -d

3. Open the following URL in your browser:

       http://localhost:8080/vnc.html?resize=scale&autoconnect=true

![](rviz.png)

#### More examples

Check the [examples](examples) folder for several examples of `docker-compose` files.

## Notes

These images are maintained by Gramazio Kohler Research
[@gramaziokohler](https://github.com/gramaziokohler>)

They are used by the [COMPAS FAB](https://gramaziokohler.github.io/compas_fab) framework
to provide a [containerized ROS backend for planning and execution](https://gramaziokohler.github.io/compas_fab/latest/backends/ros.html#ros-on-docker-1).
