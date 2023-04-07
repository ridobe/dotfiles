
#!/bin/sh

# ~/.xinitrc

#xset dpms to suspend after 20 min and lock.
#(sleep 5s && xset dpms 0 0 900) &
sleep 10 xset dpms 0 0 900 &
xautolock -time 15 -locker "sxlock -f -misc-fixed-medium-r-semicondensed--13-100-100-100-c-60-iso8859-1" &

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# If using startx, this is required for gnome-keyring for passwords
#eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
#export SSH_AUTH_SOCK

# Set a single desktop environment
#exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1
#exec startxfce4
dbus-launch --sh-syntax --exit-with-session startxfce4
#exec xmonad
