#
# /home/ridobe/.bashrc
#

#alias file .bash_alias
if [ -f ~/.bashrc ]; then
source ~/.bash_alias
fi

#Colors
red="\[$(tput setaf 1)\]"
green="\[$(tput setaf 2)\]"
yellow="\[$(tput setaf 3)\]"
blue="\[$(tput setaf 4)\]"
magenta="\[$(tput setaf 5)\]"
cyan="\[$(tput setaf 6)\]"
white="\[$(tput setaf 7)\]"
light_green="\[\e[1;32m\]"
RESET="\[$(tput sgr0)\]"

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
    echo "\n"$white$UPBAR$HORBAR$HORBAR$HORBARPLUG $RESET
}

function user_module {
     echo $HORBAR$HORBAR[$(if [[ $(id -u) = 0 ]]; then echo $red'\u'; else echo $white'\u']@[$magenta'\h'; fi)$white]
}

function location_module {
    echo $HORBAR$HORBAR[$green'\w'$white]
}

function set_bash_prompt {
    PS1=$(begin_module)$(user_module)$(location_module)$(git_module)$(file_module)$(end_module)
}

PROMPT_COMMAND=set_bash_prompt

#set $PATH
export PATH=~/bin:$PATH
export PATH=~/sbin:$PATH
export PATH=$PATH:~/android-sdk-linux/platform-tools
export PATH=$PATH:~/android-sdk-linux/tools
export PATH=$PATH:~/dotfiles/bin