#!/bin/bash

chown www-data /app -R
/sbin/setuser www-data ikiwiki --setup ${IKIWIKI_HOME}/setup.cfg
