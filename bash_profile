#. /root/.bashrc

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

