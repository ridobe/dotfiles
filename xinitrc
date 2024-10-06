
#!/bin/sh

# ~/.xinitrc

#set xautolock to lock after 15 minutes
xautolock -time 15 -locker "xset dpms force off  && i3lock -e -n -c 000000 && echo mem > /sys/power/state" &

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#conky
(sleep 10; conky -q -c /home/ridobe/.conkyrc) &
(sleep 10; conky -q -c /home/ridobe/.conkyrc2) &

# Set a single desktop environment
#exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1
exec startxfce4
#exec xmonad
