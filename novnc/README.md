# X11 NoVNC Display container

> Display X11 applications from other containers directly in the browser!

```console
    $ docker pull gramaziokohler/novnc
```

## Image Contents

* [Xvfb](http://www.x.org/releases/X11R7.6/doc/man/man1/Xvfb.1.xhtml): X11 in a virtual framebuffer
* [x11vnc](http://www.karlrunge.com/x11vnc/): a VNC server that scrapes the above X11 server
* [noNVC](https://kanaka.github.io/noVNC/): a HTML5 canvas vnc viewer
* [Fluxbox](http://www.fluxbox.org/): a small window manager
* [socat](http://www.dest-unreach.org/socat/): for use with other containers
* [supervisord](http://supervisord.org): to keep it all running

## Usage

The easiest is to use `docker-compose`, start this one container with this image and give it a name, e.g. `my-gui`, and another container where the `DISPLAY` is exported to our container, e.g. `DISPLAY=my-gui:0.0`.

## Credits

This is based on the work of [@theasp/docker-novnc](https://github.com/theasp/docker-novnc) and [@psharkey](https://github.com/psharkey/docker/tree/master/novnc), which in turn, is based on on [wine-x11-novnc-docker](https://github.com/solarkennedy/wine-x11-novnc-docker) and [octave-x11-novnc-docker](https://hub.docker.com/r/epflsti/octave-x11-novnc-docker/).