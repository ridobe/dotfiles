
#!/bin/sh

# ~/.xinitrc

#lock screen after 15 minutes
xautolock -time 15  -locker "i3lock -e -n -c 000000" &

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#conky
(sleep 10; /home/ridobe/dotfiles/start_conky) &

# Set a single desktop environment
exec startxfce4
