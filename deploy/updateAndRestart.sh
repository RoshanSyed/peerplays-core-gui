#!/bin/bash
rm -rf peerplays-core-gui || true
git clone -b $ARG1 https://github.com/peerplays-network/peerplays-core-gui.git
cd peerplays-core-gui
/home/ubuntu/.nvm/versions/node/v8.9.4/bin/pm2 delete peerplays-core-gui || true
npm install
sh ../disableHostCheck
/home/ubuntu/.nvm/versions/node/v8.9.4/bin/pm2 start --name peerplays-core-gui npm -- start
