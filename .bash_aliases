# Listing files and directories
###############################

alias ls='ls -F --color=auto'
alias ll='ls -lh'
alias lsl='ls -l'
alias la='ls -A'
alias lsa='ls -A'

# List files, in colors (-C) and with ANSI graphics (-A). To include
# hidden files and directories, add the option `-a`.
alias tree='tree -CA'
# Same as `tree` but with no files, only directories.
alias dirtree='tree -d'
# List Tree, a tree of just one level.
alias lt='tree -L 1'

#alias grep='grep --color=auto'
#alias fgrep='fgrep --color=auto'
#alias egrep='egrep --color=auto'

# Aliases for ruby on rails.
############################

alias bx='bundle exec'
alias bxr='bundle exec rake'
alias bxrs='bundle exec rake spec'

alias bxmigrate='bxr db:migrate\
  && bxr db:test:prepare\
  && bx annotate --position before'

alias railsg='rails generate'
alias railsgc='railsg controller'
alias railsgit='railsg integration_test'
alias railsgm='railsg migration'

alias binstall='bundle install'

# vim: ft=sh
