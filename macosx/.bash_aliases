# Uncomment this if you want Vim to use the aliases.
# shopt -s expand_aliases

alias ls='ls -FG'
alias lsa='ls -FGA'
alias la='ls -FGA'
alias lsl='ls -FGl'
alias ll='ls -FGl'

alias tree='tree -FAC'
alias dirtree='tree -d'

# Common typos

alias gti='git'

# Aliases for ruby on rails.

alias bx='bundle exec'
alias bxr='bundle exec rake'
alias bxrs='bundle exec rake spec'

alias bxmigrate='bxr db:migrate && bxr db:test:prepare && bx annotate --position before'

alias railsg='rails generate'
alias railsgc='railsg controller'
alias railsgit='railsg integration_test'
alias railsgm='railsg migration'

alias binstall='bundle install'

# vim: ft=sh
