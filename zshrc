# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="evan"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

ZSH_DOTENV_PROMPT=false
ZSH_DOTENV_FILE=.secrets.local
FZF_BASE=/usr/local/opt/fzf

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(docker docker-compose dotenv gitfast gpg-agent npm nvm git-prompt)

source $ZSH/oh-my-zsh.sh

# User configuration
ZSH_THEME_TERM_TAB_TITLE_IDLE="%1~:%#"

# load nearcolor module if GNU screen
[[ $TERM != "screen-256color" ]] || zmodload zsh/nearcolor

bindkey -v # Use vim bindings
setopt correct # prompt to correct typos

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export XDG_CONFIG_HOME=~/.config/

# Preferred editor for local and remote sessions
export EDITOR='vim'

export FZF_DEFAULT_COMMAND="ag --nocolor -g '' -l"

# ls aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

# aliases for git commands #
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gb='git branch'
alias gc='git checkout'
alias gpu='git pull'
alias gcl='git clone'

# a quick way to get out of current directory
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# Ruby aliases
alias bi='bundle install'
alias be='bundle exec'
alias ber='bundle exec rake'
alias bes='bundle exec rspec'

alias screen='TERM=screen-256color screen'

# Exit
alias ex='exit'

alias py='python3'
alias serve='python3 -m http.server'

man() {
	env \
		LESS_TERMCAP_mb=$'\e[01;31m' \
		LESS_TERMCAP_md=$'\e[01;31m' \
		LESS_TERMCAP_me=$'\e[0m' \
		LESS_TERMCAP_se=$'\e[0m' \
		LESS_TERMCAP_so=$'\e[01;44;33m' \
		LESS_TERMCAP_ue=$'\e[0m' \
		LESS_TERMCAP_us=$'\e[01;32m' \
		man "$@"
}

[[ -n "$SHELL" ]] || export SHELL=$(which zsh)
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
[[ -f "$HOME/.config/python/setup.py" ]] && export PYTHONSTARTUP="$HOME/.config/python/setup.py"

# add the ~/.bin to PATH if it exists
for DIR ( '' 'local/' 'cargo/' 'rbenv/')
do
  if [ -d ~/.${DIR}bin ]; then
    path+=~/.${DIR}bin
  fi
done

FOUND_RBENV=$+commands[rbenv]
[[ $FOUND_RBENV -eq 1 ]] && eval "$(rbenv init -)"

export PATH

# # Base16 Shell
BASE16_SHELL=$HOME/.shell/base16/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# tabtab source for packages
# uninstall by removing these lines
# [[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# Use all the cores
# (( $+commands[nproc] )) && export MAKE="make --jobs $(nproc)"
# (( $+commands[gnproc] )) && export MAKE="make --jobs $(gnproc)"
