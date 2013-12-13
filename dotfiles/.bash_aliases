# User aliases
alias ebrc='vim ~/.bashrc'

export PYTHONPATH=/home/dsr/github/wrench

# java junk
export CLASSPATH=.:/home/dsr/tomcat/WEB-INF/lib/servlet-api.jar

# AndroidDev PATH
export PATH=${PATH}:~/android-sdk-linux/tools
export PATH=${PATH}:~/android-sdk-linux/platform-tools
export CLASSPATH=${CLASSPATH}:~/android-sdk-linux/extras/android/support/v4/android-support-v4.jar

alias tmux='tmux -2'

alias ltmux='if tmux has; then tmux attach; else tmux new; fi'
