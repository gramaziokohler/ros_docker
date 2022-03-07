# Dockerized UR Simulator

Build image:

    docker build . -t gramaziokohler/ursim:5.11 --build-arg VERSION=5.11.1.108318 --build-arg URSIM="https://s3-eu-west-1.amazonaws.com/ur-support-site/118926/URSim_Linux-5.11.1.108318.tar.gz"

Usage:

    docker run --rm -it -d -p 5900:5900 -p 29999:29999 -p 30001-30004:30001-30004 gramaziokohler/ursim:5.11

Now you can use a VNC application (e.g. [TightVNC](https://tightvnc.com/)) to view the robots GUI, by connecting to localhost:5900. And you will have a fully functional simulator which can be used inside applications or testing pipelines.

More [information about the image here](https://github.com/urrsk/ursim_docker#parameters).

## Credits

Based on https://github.com/urrsk/ursim_docker
