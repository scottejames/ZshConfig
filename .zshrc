# Zsh init

umask 002

export SHELL=bash

# Don't make useless coredump files.  If you want a coredump,
# say "ulimit -c unlimited" and then cause a segmentation fault.
ulimit -c 0

# If not running interactively, then return
if [ -z "$PS1" ]; then
	return
fi

auto_resume=exact

# Set notify if you want to be asynchronously notified about background
# job completion.
set -o notify


autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '

[ -f ~/zsh/.zsh_siteconfig ] && . ~/zsh/.zsh_siteconfig
[ -f ~/zsh/.zsh_functions ] && . ~/zsh/.zsh_functions
[ -f ~/zsh/.zsh_aliases ] && . ~/zsh/.zsh_aliases

# Truncate path variables

PATH=`echo $PATH| dedupPath`
LD_LIBRARY_PATH=`echo $LD_LIBRARY_PATH |dedupPath`
CLASSPATH=`echo $CLASSPATH|dedupPath`

