#!/bin/bash

# Setup VNC server
Xvfb :1 -screen 0 1280x800x16 &
x11vnc -bg -quiet -forever -shared -display :1

# Copy urcaps into bundle, to be installed properly, when the simulator is started
cp -r /urcaps/*.jar /ursim/GUI/bundle/ 2>/dev/null

# Execute URSim
/ursim/start-ursim.sh ${ROBOT_MODEL}
