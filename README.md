# ROS Docker files

> ROS-in-a-box: a containerized version of different ROS nodes.

This repository provides `Dockerfile` files to run [ROS](https://ros.org) inside [Docker](https://www.docker.com/) containers:

* **Base ROS image** (`gramaziokohler/ros-base`, [docker hub link](https://hub.docker.com/r/gramaziokohler/ros-base/)): contains ROS and tools to query it over websockers with the `rosbridge`.
* **ROS + MoveIt!** (`gramaziokohler/ros-moveit-base`, [docker hub link](https://hub.docker.com/r/gramaziokohler/ros-moveit-base/)): contains a full ROS desktop installation, including MoveIt! and some tutorials.

## How to use

First, make sure [Docker](https://www.docker.com/) is installed on your system.

### Building the docker images

These images are build on Windows using WSL. The process is straight-forward:

Open your bash shell in WSL and type:

    $ make build

### Publishing docker images

Once built, you can release all images to Docker Hub in one command:

    $ make release

### Using the containers

The ideal way to use these images is to create a `docker-compose.yaml` file to set up the full environment at once. Here's an example setup:

```yaml
version: '3'
services:
  ros-master:
    image: gramaziokohler/ros-base
    container_name: ros-master
    ports:
      - "11311:11311"
    command:
      - roscore

  ros-bridge:
    image: gramaziokohler/ros-base
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
```

Then start it all with:

    $ docker-compose up -d
