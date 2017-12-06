#!/bin/bash
rm -f /tmp/.X0-lock /tmp/.X11-unix/X0
chown -R ${DUID:-1000}:${DGID:-1000} $HOME/.
chmod 700 $HOME/.ssh
chmod 700 $HOME/.vnc
chmod 600 $HOME/.vnc/passwd
chmod 755 $HOME/.vnc/xstartup
grep "^$USER:" /etc/passwd ||
    echo "$USER:x:$DUID:$DGID:$USER,,,:$HOME:/bin/bash" >> /etc/passwd
grep "^$USER:" /etc/group ||
    echo "$USER:x:$DGID:" >> /etc/group
grep "^$USER " /etc/group ||
    echo "$USER ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
#sudo -u $USER /bin/bash -i -l
start-dropbear.sh & sleep 1
sudo -u $USER -i tightvncserver \
    -geometry ${VNC_GEOMETRY:-1600x900} \
    :0
sleep 1000000
