# Build:
#  docker build --rm -f Dockerfile -t gramaziokohler/novnc .
#
# Usage:
#  docker pull gramaziokohler/novnc

FROM debian:stretch-slim

# Install git, supervisor, VNC, & X11 packages
RUN apt-get update && apt-get install -y \
    bash \
    ca-certificates \
    fluxbox \
    git \
    net-tools \
    socat \
    supervisor \
    x11vnc \
    xterm \
    xvfb \
    # Clear apt-cache to reduce image size
    && rm -rf /var/lib/apt/lists/*

# Setup demo environment variables
ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768 \
    RUN_FLUXBOX=yes

RUN git clone -b v1.1.0 https://github.com/novnc/noVNC.git /opt/novnc \
    && rm -rf /opt/novnc/.git

COPY . /root

EXPOSE 8080

CMD ["supervisord", "-c", "/root/.supervisord/supervisord.conf"]
