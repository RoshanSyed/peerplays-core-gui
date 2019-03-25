#!/bin/bash
docker stop peerplays-core-gui || true
docker rm peerplays-core-gui || true
docker build -t peerplays/core-gui ../
docker run -p 8082:8082 --name peerplays-core-gui -dit peerplays/core-gui
