#!/bin/bash

echo $MAIL_PORT_25_TCP_ADDR

cat > /etc/exim4/update-exim4.conf.conf << EOF
dc_eximconfig_configtype='satellite'
dc_other_hostnames=''
dc_local_interfaces=''
dc_readhost=''
dc_relay_domains=''
dc_minimaldns='false'
dc_relay_nets=''
dc_smarthost='$MAIL_PORT_25_TCP_ADDR'
CFILEMODE='644'
dc_use_split_config='true'
dc_hide_mailname='true'
dc_mailname_in_oh='true'
dc_localdelivery='mail_spool'
EOF

/usr/sbin/update-exim4.conf

echo starting exim4 now ...
/usr/sbin/exim4 -q30m -bdf


