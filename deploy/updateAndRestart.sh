#!/bin/bash
git clone -b $1 https://github.com/RoshanSyed/peerplays-core-gui.git
cd peerplays-core-gui
whoami
/home/ubuntu/.nvm/versions/node/v8.9.4/bin/pm2 delete peerplays-core-gui || true
npm install
/home/ubuntu/.nvm/versions/node/v8.9.4/bin/pm2 start --name peerplays-core-gui npm -- start
