#!/bin/bash
git clone -b $CI_COMMIT_REF_NAME https://github.com/RoshanSyed/peerplays-core-gui.git
cd peerplays-core-gui
whoami
pm2 delete peerplays-core-gui || true
npm install
pm2 start --name peerplays-core-gui npm -- start
