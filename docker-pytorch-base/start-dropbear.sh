#!/bin/sh

SCONF="/etc/ssh"
CONF="/etc/dropbear"
KEYDSS="$CONF/dropbear_dss_host_key"
KEYRSA="$CONF/dropbear_rsa_host_key"

dbc() {
    test -f $1 &&
    /usr/lib/dropbear/dropbearconvert openssh dropbear $1 $2 &&
    test -f $1.pub &&
    cp $1.pub $2.pub
}

# Check if conf dir exists
test -d $CONF || mkdir -p $CONF
chown root:root $CONF
chmod 755 $CONF

test -f $KEYDSS ||
dbc $SCONF/ssh_host_dsa_key $KEYDSS ||
dropbearkey  -t dss -f $KEYDSS

test -f $KEYRSA ||
dbc $SCONF/ssh_host_rsa_key $KEYRSA ||
dropbearkey  -t rsa -f $KEYRSA -s 2048

chown root:root $KEYDSS $KEYRSA
chmod 600 $KEYDSS $KEYRSA

exec /usr/sbin/dropbear -s -E -F
