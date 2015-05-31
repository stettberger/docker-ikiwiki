#!/bin/bash

set -e

while true; do
    echo "Waiting for changes..."
    inotifywait -e modify ${IKIWIKI_HOME}/www.git/refs/heads/master || true
    echo "Refresh in 2 Seconds"
    sleep 2;
    /sbin/setuser www-data ikiwiki --refresh --setup ${IKIWIKI_HOME}/setup.cfg
    echo Refresh Done
done
