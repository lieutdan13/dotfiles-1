# User aliases
alias ebrc='vim ~/.bashrc'

# java junk
export CLASSPATH=.:/home/dsr/tomcat/WEB-INF/lib/servlet-api.jar

# AndroidDev PATH
export PATH=${PATH}:~/android-sdk-linux/tools
export PATH=${PATH}:~/android-sdk-linux/platform-tools
export CLASSPATH=${CLASSPATH}:~/android-sdk-linux/extras/android/support/v4/android-support-v4.jar

alias tmux='tmux -2'

alias ltmux='if tmux has; then tmux attach; else tmux new; fi'

# start bin with as a background job
#alias nulled='firefox >> /dev/null 2>&1 &'

# allows us to run a command in the background
function null_command {
    $1 >> /dev/null 2>&1 &
}

function upgrade_all {
    sudo apt-get update && sudo apt-get upgrade
}

function puppet_module {
# creates a skeleton puppet module
    init="class $1 {\n \
        include $1::params, $1::install, $1::config, $1::service \n} \n \
        include $1"

    install="class $1::install {\n \
        \tpackage { $1::params::$1_package_name:\n \
        \t\tensure => installed,\n \
        \t}\n \
        }"
        
    config="class $1::config {\n \
        \t}\n}"

    params=" \
class $1::params { \n \
    \tcase \$operatingsystem { \n \
     \t\tSolaris: { \n\n \
       \t\t} \n \

        \t\t/(Ubuntu|Debian)/: { \n\n \
        \t\t} \n \

        \t\t/(RedHat|Fedora|CentOS)/: { \n\n \
        \t\t} \n \
    \t} \n \
} "


    mkdir -p $1/{files,manifests,templates}
    echo -e $init >> $1/manifests/init.pp
    echo -e $install >> $1/manifests/install.pp
    echo -e $config >> $1/manifests/config.pp
    echo -e $params >> $1/manifests/params.pp
}
