# MIT License
#
# Original from https://github.com/ahobsonsayers/DockURSim
# Copyright (c) 2019 Arran Hobson Sayers
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

FROM ubuntu:latest

# Set Version Information
ARG VERSION
ARG URSIM
LABEL build_version="URSim Version: ${VERSION}"
LABEL description="UR simulator e-series"

# Set Timezone
ENV TZ "Europe/Copenhagen"

# Set Home Directory
ENV HOME /ursim

# Set robot model - Can be UR3, UR5, UR10 or UR16
ENV ROBOT_MODEL UR3

# Set display
ENV DISPLAY :1

# Install dependencies
RUN apt-get update && \
    apt-get install -qy --no-install-recommends openjdk-8-jre psmisc && \
    apt-get -y install curl && \
    apt-get install -y x11vnc xvfb && \
    update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java 10000

# Setup JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Download URSim
RUN curl ${URSIM} -o URSim.tar.gz && \
    tar xvzf URSim.tar.gz && \
    rm URSim.tar.gz && \
    mv  /ursim* /ursim

# Install URSim
RUN cd /ursim && \
    sed -i 's|apt-get -y install|apt-get -qy install --no-install-recommends|g' install.sh && \
    sed -i 's|tty -s|(exit 0)|g' install.sh && \
    sed -i 's|needToInstallJava$|(exit 0)|g' install.sh && \
    sed -i '/for TYPE in UR3 UR5 UR10 UR16/,$ d' install.sh  && \
    sed -i 's/libcurl3/libcurl4/g' install.sh  && \
    sed -i 's|pkexec ||g' install.sh && \
    sed -i 's|sudo ||g' install.sh && \
    sed -i 's|sudo ||g' ursim-certificate-check.sh && \
    ./install.sh

# Clean up
RUN rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

# Make it possible for polyscope to find uradmin scripts
ENV PATH "$PATH:/ursim/usr/bin"

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Make a directory to store urcaps
RUN mkdir /urcaps

# VNC viewer
EXPOSE 5900
# Modbus Port
EXPOSE 502
# Interface Ports
EXPOSE 29999
EXPOSE 30001-30004

# This will start the simulator
ENTRYPOINT ["/entrypoint.sh"]
