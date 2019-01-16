
#!/bin/sh

# ~/.xinitrc

if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
    eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi

#xset dpms to suspend after 20 min and lock.
(sleep 15s && xset dpms 0 1200 0) &
xautolock -time 20 -locker "sxlock -f -misc-fixed-medium-r-semicondensed--13-100-100-100-c-60-iso8859-1" &

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Set a single desktop environment
#exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1
exec startxfce4
#exec xmonad
