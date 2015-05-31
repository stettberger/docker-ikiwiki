#!/bin/bash

/sbin/setuser www-data git clone ${IKIWIKI_HOME}/www.git ${IKIWIKI_HOME}/www.checkout
ln -s ${IKIWIKI_HOME}/www.db  ${IKIWIKI_HOME}/www.checkout/.ikiwiki
chown www-data ${IKIWIKI_HOME}/www.db -R
chown www-data ${IKIWIKI_HOME}/www.checkout -R

/sbin/setuser www-data git config --global user.email "$IKIWIKI_ADMIN_EMAIL"
/sbin/setuser www-data git config --global user.name "Within Docker"


