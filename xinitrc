
#!/bin/sh

# ~/.xinitrc

/home/ridobe/dotfiles/bin/xrandr_toggle &

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
exec startxfce4
