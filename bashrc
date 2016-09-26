export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export XDG_CONFIG_HOME=~/.config/

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color) color_prompt=yes;;
esac


# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  GIT_PS1_SHOWCOLORHINTS=true
  GIT_PS1_SHOWDIRTYSTATE=true

  # Colors!
  BLACK="\[\033[00m\]"
  BLUE="\[\033[0;34m\]"
  GREEN="\[\033[0;32m\]"
  PURPLE="\[\033[0;35m\]"
  YELLOW="\[\033[1;33m\]"

  # Symbols
  TOP_LEFT=$'\xe2\x94\x8c'
  BOTTOM_LEFT=$'\xe2\x94\x94'
  HORIZONTAL_LINE=$'\xe2\x94\x80'
  SPARKLE=$'\xe2\x9c\xa8'

  # BASH PS1 escapes
  USER="\u"
  SHORT_PATH="\w"
  NEW_LINE="\n"
  PROMPT_COMMAND='__git_ps1 \
    "$PURPLE$TOP_LEFT[$BLUE$SPARKLE$YELLOW $USER$PURPLE][$BLACK$SHORT_PATH$PURPLE]$BLACK" \
    "$NEW_LINE$PURPLE$BOTTOM_LEFT$HORIZONTAL_LINE$BLACK "'
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
  *)
    ;;
esac

# Check if a specified program exists in PATH
command_exists () {
  command -v "$1" > /dev/null 2>&1
}

if command_exists git; then
  # add the git branch script for branch display in the terminal
  source ~/.git-prompt.sh
  source ~/.git-completion.bash
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# BASH Completion for aliases (code from SO)
source ~/.alias-completion

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Color-enabled man pages!
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

# add the ~/.bin to PATH if it exists
if [ -d ~/.bin ]; then
  export PATH="~/.bin:$PATH"
fi

if [ -d ~/.local/bin ]; then
  export PATH="~/.local/bin:$PATH"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Add Homebrew to the PATH
export PATH="/usr/local/bin:$PATH"

# add rbenv to PATH when possible
if [ -d ~/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# NPM Command Completion
if command_exists npm; then
  source ~/.npm-completion.sh
fi

# Base16 Shell
export BASE16_SHELL="$HOME/.shell/base16/scripts/base16-materia.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL


# Local overrides
[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local


