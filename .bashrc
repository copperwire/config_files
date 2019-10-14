source ~/.config/nvim/plugged/gruvbox/gruvbox_256palette_osx.sh

jupyter_tunnel ()
{
ssh -N -f -L localhost:8998:localhost:8998 ifi
ssh -t ifi 'ssh -N -f -L localhost:8998:localhost:9889 vegeta'
}

export PATH="$PATH:~/bin"

export CLICOLOR=1

source /usr/local/lib/bazel/bin/bazel-complete.bash

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=$PATH:$HOME/Library/Python/3.7/bin

#Powerline setup 
powerline-daemon -q

export POWERLINE_CONFIG_COMMAND=powerline-config
POWERLINE_BASH_CONTINUATIION=1
POWERLINE_BASH_SELECT=1
. $HOME/Library/Python/3.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh

launchctl setenv PATH $PATH
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
