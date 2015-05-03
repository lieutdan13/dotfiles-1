# new shell commands
xmodmap $HOME/.Xmodmap
xset r rate 250 35

# [colors]
# Reset
Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White

# Bold
BBlack="\[\033[1;30m\]"       # Black
BRed="\[\033[1;31m\]"         # Red
BGreen="\[\033[1;32m\]"       # Green
BYellow="\[\033[1;33m\]"      # Yellow
BBlue="\[\033[1;34m\]"        # Blue
BPurple="\[\033[1;35m\]"      # Purple
BCyan="\[\033[1;36m\]"        # Cyan
BWhite="\[\033[1;37m\]"       # White

# Underline
UBlack="\[\033[4;30m\]"       # Black
URed="\[\033[4;31m\]"         # Red
UGreen="\[\033[4;32m\]"       # Green
UYellow="\[\033[4;33m\]"      # Yellow
UBlue="\[\033[4;34m\]"        # Blue
UPurple="\[\033[4;35m\]"      # Purple
UCyan="\[\033[4;36m\]"        # Cyan
UWhite="\[\033[4;37m\]"       # White

# Background
On_Black="\[\033[40m\]"       # Black
On_Red="\[\033[41m\]"         # Red
On_Green="\[\033[42m\]"       # Green
On_Yellow="\[\033[43m\]"      # Yellow
On_Blue="\[\033[44m\]"        # Blue
On_Purple="\[\033[45m\]"      # Purple
On_Cyan="\[\033[46m\]"        # Cyan
On_White="\[\033[47m\]"       # White

# High Intensty
IBlack="\[\033[0;90m\]"       # Black
IRed="\[\033[0;91m\]"         # Red
IGreen="\[\033[0;92m\]"       # Green
IYellow="\[\033[0;93m\]"      # Yellow
IBlue="\[\033[0;94m\]"        # Blue
IPurple="\[\033[0;95m\]"      # Purple
ICyan="\[\033[0;96m\]"        # Cyan
IWhite="\[\033[0;97m\]"       # White

# Bold High Intensty
BIBlack="\[\033[1;90m\]"      # Black
BIRed="\[\033[1;91m\]"        # Red
BIGreen="\[\033[1;92m\]"      # Green
BIYellow="\[\033[1;93m\]"     # Yellow
BIBlue="\[\033[1;94m\]"       # Blue
BIPurple="\[\033[1;95m\]"     # Purple
BICyan="\[\033[1;96m\]"       # Cyan
BIWhite="\[\033[1;97m\]"      # White

# High Intensty backgrounds
On_IBlack="\[\033[0;100m\]"   # Black
On_IRed="\[\033[0;101m\]"     # Red
On_IGreen="\[\033[0;102m\]"   # Green
On_IYellow="\[\033[0;103m\]"  # Yellow
On_IBlue="\[\033[0;104m\]"    # Blue
On_IPurple="\[\033[10;95m\]"  # Purple
On_ICyan="\[\033[0;106m\]"    # Cyan
On_IWhite="\[\033[0;107m\]"   # White


# [bash]
alias ebrc='vim ~/.bashrc'
alias eba='vim ~/.bash_aliases'
alias sba='source ~/.bash_aliases'

# [git]
alias g='git'

alias gpom='git pull --rebase origin master'
alias gpum='git pull --rebase upstream master'
alias gpud='git pull --rebase upstream develop'

alias gpuom='git push origin master'
alias gpuod='git push origin develop'

alias grmmerged='git branch -D `git branch --merged | grep -v \* | xargs`'

# [lxc]
alias lxc-ls='lxc-ls --fancy'

# [ssh]
alias ssh='ssh -i $HOME/.ssh/id_ed25519 $1'
alias ssh_onshift='ssh -i $HOME/.ssh/id_onshift $1'

# [tmux]
alias tmux='tmux -2'
alias ltmux='if tmux has; then tmux attach; else tmux new; fi'

# [passman]
alias passman_mount='truecrypt $HOME/.passman $HOME/mnt/truecrypt0'

# [func]
function check_ulimits {
    for USER in `ps -ef | egrep -v '^UID' | awk '{ print $1 }' | sort -u`; do echo -n "$USER: "; ps -u $USER -L | wc -l; done | sort -rn -k2  
}

function check_sockets {
    ss -f link -n -l -p
}

function gen_passwd_az {
    cat /dev/urandom| tr -dc 'a-zA-Z0-9' | fold -w 16| head -n 4
}

function gen_passwd_safe {
    cat /dev/urandom| tr -dc 'a-zA-Z0-9!@#$%^&*(){}?><-_' | fold -w 24| head -n 4
}

# allows us to run a command in the background
null_command() {
    $1 >> /dev/null 2>&1 &
}

function upgrade_all {
    sudo apt-get update && sudo apt-get upgrade
}

# Custom $PS1
# Various variables you might want for your PS1 prompt instead
Time12h="\T"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"

# This PS1 snippet was adopted from code for MAC/BSD I saw from: http://allancraig.net/index.php?option=com_content&view=article&id=108:ps1-export-command-for-git&catid=45:general&Itemid=96
# I tweaked it to work on UBUNTU 11.04 & 11.10 plus made it mo' better
#       - some guy on the internet
#
if [ -f $HOME/.git-prompt.sh ]; then
    source $HOME/.git-prompt.sh
fi

export PS1="$Cyan[$Color_Off \u@\h":'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$IGreen'"$(__git_ps1 " (%s)"); \
  else \
    # @5 - Changes to working tree
    echo "'$IRed'"$(__git_ps1 " {%s}"); \
  fi) '$Color_Off$PathShort$Cyan' ]'$Color_Off'\n\$ "; \
else \
  # @2 - Prompt when not in GIT repo
  echo " '$Color_Off$PathShort$Cyan' ]'$Color_Off'\n\$ "; \
fi)'

if ! echo $PATH | grep -q "$HOME/bin"; then
    export PATH=$PATH:$HOME/bin
fi