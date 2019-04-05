#!/bin/bash
rm -rf peerplays-core-gui || true
git clone -b $ARG1 https://github.com/peerplays-network/peerplays-core-gui.git
sh /usr/local/bin/peerplays-core-gui/run-all.sh