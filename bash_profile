#!/bin/bash

alias cp='cp -ir'
alias la='ls -la'
alias ll='ls -l'
alias g='git'
alias gb='git branch'
alias gba='git branch --all'
alias gco='git checkout'
alias grep='grep --color'
alias gss='git status -s'
alias into='heroku run rails c -r'
alias mv='mv -i'
alias psgrep='ps aux | grep'
alias rc='bundle exec rails c'
alias rdm='bundle exec rake db:migrate'
alias rdms='bundle exec rake db:migrate:status'
alias rdr='bundle exec rake db:rollback'
alias rgm='bundle exec rails g migration'
alias rm='rm -ir'
alias rs='rails s'
alias rr='bundle exec rake routes'
alias rrg='bundle exec rake routes | grep'

[[ -f ~/.bash_functions ]] && source ~/.bash_functions

# Brew bash completion
if type brew 2&>/dev/null;
then
    for COMPLETION in $(brew --prefix)/etc/bash_completion.d/*
    do
        [[ -f $COMPLETION ]] && source "$COMPLETION"
    done
    [[ -f $(brew --prefix)/etc/profile.d/bash_completion.sh ]] &&
        source "$(brew --prefix)/etc/profile.d/bash_completion.sh"
fi

# Heroku completion
HEROKU_AC_BASH_SETUP_PATH="$HOME/Library/Caches/heroku/autocomplete/bash_setup"
test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;

# RBENV
eval "$(rbenv init -)"

# HOMEBREW OPTIONS
# https://github.com/drduh/macOS-Security-and-Privacy-Guide/issues/138
HOMEBREW_NO_INSECURE_REDIRECT=1
HOMEBREW_CASK_OPTS=--require-sha
# HOMEBREW_NO_ANALYTICS=1

# Colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# The color designators are as follows:                  # The order of the attributes are as follows:
# a     black
# b     red                                              # 1.   directory
# c     green                                            # 2.   symbolic link
# d     brown                                            # 3.   socket
# e     blue                                             # 4.   pipe
# f     magenta                                          # 5.   executable
# g     cyan                                             # 6.   block special
# h     light grey                                       # 7.   character special
# A     bold black, usually shows up as dark grey        # 8.   executable with setuid bit set
# B     bold red                                         # 9.   executable with setgid bit set
# C     bold green                                       # 10.  directory writable to others, with sticky bit
# D     bold brown, usually shows up as yellow           # 11.  directory writable to others, without sticky bit
# E     bold blue
# F     bold magenta
# G     bold cyan
# H     bold light grey; looks like bright white
# x     default foreground or background

# Note that the above are standard ANSI colors.  The actual display may
# differ depending on the color capabilities of the terminal in use.

# PS1 (with colors)
export PS1="\[\033[01;91m\]\h\[\033[0m\] \[\033[01;94m\]\W\[\033[0m\] $ "
# Include .local in paths
[ -d $HOME/.local/bin ] && export PATH="$PATH:$HOME/.local/bin"
# Include sbin in paths
[ -d /usr/local/sbin ] && export PATH="/usr/local/sbin:$PATH"
