### Path

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

### Rbenv

eval "$(rbenv init -)"

### Auto-completion

source `brew --repository`/Library/Contributions/brew_bash_completion.sh

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Why need this? I think it's because git was not installed with brew.
.  /usr/local/git/contrib/completion/git-completion.bash

### Prompt

RED="\[\e[1;31m\]"
LIGHT_GRAY="\[\e[1;39m\]"
COLOR_NONE="\[\e[0m\]"

function ruby_version {
  rbenv version | sed -e "s/ (set.*$//"
}

# function git_branch() {
#   branch=$(git branch 2>/dev/null | cut -d' ' -f2)
#   if [ "$?" == "0" ]; then echo $branch; fi
# }

# Return the prompt symbol to use, colorized based on the return value of the
# previous command.
function set_prompt_symbol () {
  if test $1 -eq 0 ; then
    PROMPT_SYMBOL="⇒"
  else
    PROMPT_SYMBOL="${RED}$1⇒${COLOR_NONE}"
  fi
}

function set_bash_prompt {
  set_prompt_symbol $?

  PS1="\n⇒ ${LIGHT_GRAY}\w [\$(ruby_version)] \$(__git_ps1)${COLOR_NONE}\n${PROMPT_SYMBOL} "
  PS2="… > "
}

PROMPT_COMMAND=set_bash_prompt

### Alias
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

### Environment variables

export EDITOR='mvim -f --nomru -c "au VimLeave * !open -a Terminal"'

### History

HISTSIZE=2000
