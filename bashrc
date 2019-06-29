# .bashrc
# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias k='kubectl'
alias kgp='kubectl get pods'
alias kdp='kubectl describe pods'
alias kl='kubectl logs'

NORMAL="\[\033[00m\]"
BLUE="\[\033[01;34m\]"
YELLOW="\[\e[1;33m\]"
GREEN="\[\e[1;32m\]"

source /root/kube_context.sh

# export PS1="${BLUE}\W ${GREEN}\u ${YELLOW}\$(__kube_ps1) ${NORMAL}>> "
export PS1="${YELLOW}\$(__kube_ps1) ${BLUE}\W ${GREEN}\u ${NORMAL}>> "

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
