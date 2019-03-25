#!/bin/bash
docker stop peerplays-core-gui || true
docker rm peerplays-core-gui || true
git clone -b develop https://github.com/RoshanSyed/peerplays-core-gui.git
cd peerplays-core-gui
docker build -t peerplays-core/gui .
docker run -p 8082:8082 --name peerplays-core-gui -dit peerplays-core/gui
