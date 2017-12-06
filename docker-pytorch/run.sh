#!/bin/bash

rm -f /tmp/.X0-lock /tmp/.X11-unix/X0
set -a
USER=${USER:-user}
HOME=/home/${USER}
DUID=${DUID:-1000}
DGID=${DGID:-1000}
set +a
mkdir -p $HOME
test -f /root/.Xauthority && cp -av /root/.Xauthority $HOME/
chown -R $DUID:$DGID $HOME/.
grep "^$USER:" /etc/passwd ||
    echo "$USER:x:$DUID:$DGID:$USER,,,:$HOME:/bin/bash" >> /etc/passwd
grep "^$USER:" /etc/group ||
    echo "$USER:x:$DGID:" >> /etc/group
grep "^$USER " /etc/group ||
    echo "$USER ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

sudo -u "#$DUID" "${@:-/bin/bash}"
