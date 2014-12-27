# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
# Following is the original line, before installing rvm (Ruby Version Manager)
#[ -z "$PS1" ] && return
# After installing rvm, this turns to :
if [[ -n "$PS1" ]] ; then

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
# HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
# HISTCONTROL=ignoreboth
HISTCONTROL=erasedups
HISTIGNORE="ls:la:ll:cd:cd -"

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

RED="\[\e[1;31m\]"
COLOR_PROMPT="\[\e[1;35m\]"
COLOR_PROMPT_LIGHT="\[\e[0;35m\]"
COLOR_NONE="\[\e[0m\]"

ruby_version()
{
  ~/.rvm/bin/rvm-prompt i v
}

# Return the prompt symbol to use, colorized based on the return value of the
# previous command.
set_prompt_symbol()
{
  if test $1 -eq 0 ; then
    PROMPT_SYMBOL="●"
  else
    PROMPT_SYMBOL="${RED}█ $1${COLOR_NONE}"
  fi
}

set_bash_prompt()
{
  set_prompt_symbol $?

  PS1="${COLOR_PROMPT}● \
${COLOR_PROMPT_LIGHT}\A \
${COLOR_PROMPT}[\w]\
${COLOR_PROMPT_LIGHT}\$(__git_ps1) (\$(ruby_version)) \
${COLOR_NONE}\n${PROMPT_SYMBOL} "
  PS2="… > "
}

PROMPT_COMMAND=set_bash_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# Je ne devrais pas avoir à ajouter le chemin suivant, mais l'installation de rubygems
# n'a pas bien fonctionnée.
PATH=$PATH:/var/lib/gems/1.8/bin

PATH=$PATH:/home/xavier/bin

PATH=$PATH:/home/xavier/local/bin/elixir-0.10.0/bin/

PATH=$PATH:/home/xavier/local/bin/racket-5.3.6/bin/

PATH=$PATH:/home/xavier/local/bin/shoes3/dist/

PATH=$PATH:/home/xavier/bin/julia/

PATH=$PATH:/usr/local/lib/

# close the very first if of this file
fi 

# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Speedenv script needs to run commands in new shells afer .bashrc
eval "$BASH_POST_RC"
