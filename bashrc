#
# /home/ridobe/.bashrc
#

#alias file .bash_alias
if [ -f ~/.bashrc ]; then
source ~/.bash_alias
fi

#Colors
red="\[\e[0;31m\]"
green="\[\e[0;32m\]"
yellow="\[\e[0;33m\]"
blue="\[\e[0;34m\]"
magenta="\[\e[0;35m\]"
cyan="\[\e[0;36m\]"
white="\[\e[0;37m\]"
light_green="\[\e[1;32m\]"
TXTRST="\[\e[0m\]"

DOWNBAR='\342\224\214'
HORBAR='\342\224\200'
UPBAR='\342\224\224'
HORBARPLUG='\342\225\274'

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

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

function git_module {
    if [[ $(git status 2> /dev/null) ]];then
        echo $white$HORBAR$HORBAR[$light_green$(parse_git_branch)$white];
    fi
}
 
function file_module {
    echo $HORBAR$HORBAR$white[$cyan$(ls | wc -l) files$white]
}

function begin_module {
    echo $white$DOWNBAR$HORBAR
}

function end_module {
    echo "\n"$white$UPBAR$HORBAR$HORBAR$HORBARPLUG $TXTRST
}

function user_module {
    echo $HORBAR$HORBAR[$white'\u']@[$yellow'\h'$white]
}

function location_module {
    echo $HORBAR$HORBAR[$green'\w'$white]
}

function set_bash_prompt {
    PS1=$(begin_module)$(user_module)$(location_module)$(git_module)$(file_module)$(end_module)
}

PROMPT_COMMAND=set_bash_prompt

#text editor
export EDITOR="nano"

#History expansion, format and retention
HISTFILE="$HOME/.bash_history."
HISTFILESIZE=
HISTSIZE=
shopt -s histappend
HISTTIMEFORMAT="%h %d %H:%M:%S "
HISTCONTROL=ignoreboth:erasedups
HISTIGNORE="ls:ps:history"
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

#set $PATH
export PATH=$PATH:~/bin
export PATH=/usr/bin:$PATH
export PATH=$PATH:/usr/lib/ccache/bin
export PATH=$PATH:~/android-sdk-linux/platform-tools
export PATH=$PATH:~/android-sdk-linux/tools/bin
export PATH=$PATH:~/android-sdk-linux/tools
export PATH=$PATH:~/dotfiles/bin
export PATH=$PATH:~/.local/bin
