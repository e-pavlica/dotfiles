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

# Disable permissions check on completions
ZSH_DISABLE_COMPFIX=true

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(aws docker-compose dotenv gitfast gpg-agent npm nvm git-prompt )

source $ZSH/oh-my-zsh.sh

# User configuration
ZSH_THEME_TERM_TAB_TITLE_IDLE="%1~:%#"
ZSH_THEME_TERM_TITLE_IDLE="%1~:%#"

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
[[ -f "$HOME/.zshrc.aliases" ]] && source "$HOME/.zshrc.aliases"
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
FOUND_KUBECTL=$+commands[kubectl]
[[ $FOUND_KUBECTL -eq 1 ]] && source <(kubectl completion zsh)

export PATH

# # Base16 Shell
BASE16_SHELL=$HOME/.shell/base16/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && source "$BASE16_SHELL/profile_helper.sh"
