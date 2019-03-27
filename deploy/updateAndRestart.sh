#!/bin/bash
pm2 stop peerplays-core-gui || true
pm2 delete peerplays-core-gui || true
git clone -b develop https://github.com/RoshanSyed/peerplays-core-gui.git
cd peerplays-core-gui
npm install
pm2 start --name peerplays-core-gui npm -- start
