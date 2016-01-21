#
# /home/ridobe/.bashrc
#

#alias file .bash_alias
if [ -f ~/.bashrc ]; then
source ~/.bash_alias
fi

#Colors
[[ $- != *i* ]] && return

red="\[\e[0;31m\]"
green="\[\e[0;32m\]"
yellow="\[\e[0;33m\]"
blue="\[\e[0;34m\]"
magenta="\[\e[0;35m\]"
cyan="\[\e[0;36m\]"
white="\[\e[0;37m\]"

#usr/root colors
if [ `id -u` -eq "0" ]; then
	root="${red}"
else
	root="${white}"
fi

#ssh prompt
if [ -n "$SSH_CLIENT" ]; then text=" ssh-session"
fi
export PS1='\[\e[1;33m\]\u@\h:\w${text}$\[\e[m\] '

#Weclome message
c1="$(tput sgr0)$(tput setaf 7)"
c2="$(tput bold)$(tput setaf 0)"
c3="$(tput bold)$(tput setaf 7)"

echo ""
echo ""
echo " $c1                  +"
echo " $c1                  #"
echo " $c1                 ###"
echo " $c1                #####"
echo " $c1                ######"
echo " $c1               ; #####;"
echo " $c1              +##.#####"
echo " $c1             +##########"
echo " $c1            ######$c2#####$c1##;"
echo " $c1           ###$c2############$c1+  $c3 Welcome to Archlinux! - ridobe"
echo " $c1          #$c2######   #######"
echo " $c2        .######;     ;###; '"
echo " $c2       .#######;     ;#####."
echo " $c2       #########.   .########'"
echo " $c2      ######'           '######"
echo " $c2     ;####                 ####;"
echo " $c2     ##'                     '##"
echo " $c2    #'                         '#"
echo ""
echo ""

#PS1/2
PS1="\[\e[0;37m\]┌─ ≺${root}\u\[\e[0;37m\]│\[\e[0;33m\]\h\[\e[0;37m\]≻ [\[\e[0;32m\]\w\[\e[0;37m\]]\n\[\e[0;37m\]└──╼ \[\e[0m\]"
PS2="   ╾──╼ "

#text editor
export EDITOR="nano"

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoreboth:erasedups

# Expand the history size
HISTFILESIZE=100000
HISTSIZE=100000

#print the time stamps associated with each history entry
export HISTTIMEFORMAT="%h %d %H:%M:%S "

#To append commands to the history file, rather than overwrite it
shopt -s histappend

#set $PATH
export PATH=~/bin:$PATH
export PATH=~/sbin:$PATH
export PATH=$PATH:~/android-sdk-linux/platform-tools
export PATH=$PATH:~/dotfiles/bin
export PATH=$PATH:~/depot_tools