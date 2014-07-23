###############################################################
#       BASH Aliases for Evan Pavlica, updated 2/2014         #
###############################################################

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# aliases for git commands #

alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'

#clear the screen #
alias c='clear'

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# become root #
alias su='sudo -i'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# alias for the python simple HTTP server
alias simpleserve='python -m SimpleHTTPServer'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#use passenger instead of rails server
alias passenger="bundle exec passenger start -p 3000"

# Rails aliases
alias bi='bundle install'
alias be='bundle exec'
alias dbm='rake db:migrate'

### 
#  For Ubuntu
###

# update the package manager #
alias update='sudo apt-get update'
alias dist-up='sudo apt-get dist-upgrade'

# install stuff #
alias install='sudo apt-get install'

# run pocket #
alias pocket='java -jar /opt/pocket'


