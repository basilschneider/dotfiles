# .bashrc

# Sourced by purely interactive shells, e.g.:
# $ sudo su
# $ bash
# $ ssh user@host command
# Since .bash_profile sources .bashrc, this file is always sourced

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Set PS1 according to server you are working on
colorUser='0;32'
colorPath='0;36'
case "$HOSTNAME" in
    basil) colorServer='1;31';;
    atlas-tier3*) colorServer='0;33';;
    lxplus*) colorServer='1;33';;
    *) colorServer='1;35';;
esac
export PROMPT_DIRTRIM=3
export PS1="\[\033[${colorUser}m\]\u\[\033[00m\]@\[\033[${colorServer}m\]\h\[\033[00m\]: \[\033[${colorPath}m\]\w\[\033[00m\] \$ "

#if [ "$server" = true ]; then
#    export LD_LIBRARY_PATH=~/pkg/lib:$LD_LIBRARY_PATH
#    export MANPATH=~/pkg/share/man:$MANPATH
#    export PATH=~/pkg/bin:$PATH
#else
#    export PATH=~/bin/:~/bin/texbin/:$PATH
#fi
export LD_LIBRARY_PATH=~/pkg/lib:$LD_LIBRARY_PATH
export MANPATH=~/pkg/share/man:$MANPATH
export PATH=~/pkg/bin:$PATH

export EDITOR=vim

### Set uniform history file among all servers to be able to access it from all servers
HISTFILE=~/.bash_history

### Set keyboard for proper use of backspace
#stty erase ^?

### Set termcap locally, needed for proper running of rxvt-unicode-256color and screen-256color-s
export TERMCAP=~/.termcap

test -s ~/.alias && . ~/.alias

#xset b off

# Source command-not-found hook
cnfhook=/usr/share/doc/pkgfile/command-not-found.bash
[ -f "$cnfhook" ] && . "$cnfhook" && unset cnfhook

# Set workspace variable on lxplus
if [[ "$HOSTNAME" == lxplus* ]]; then
    export workspace=/afs/cern.ch/work/b/bschneid/
fi

# Set vi mode! Woohoo!
set -o vi
