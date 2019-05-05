# Language config
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

__energize_ps1 () {
  # Colors!
  local BLACK="\[\033[00m\]"
  local BLUE="\[\033[0;34m\]"
  local RED="\[\033[0;31m\]"
  local GREEN="\[\033[0;32m\]"
  local PURPLE="\[\033[0;35m\]"
  local YELLOW="\[\033[1;33m\]"
  local WHITE="\[\033[1;37m\]"
  local ARCH_FG="\[\033[38;5;39m\]"
  local USER_FG="\[\033[1;38;5;97m\]"

  # Symbols
  local TOP_LEFT=$'\xe2\x95\xad'
  local BOTTOM_LEFT=$'\xe2\x95\xb0'
  local HORIZONTAL_LINE=$'\xe2\x94\x80'
  local SPARKLE=$'\xe2\x9c\xa8'
  local DARWIN=$'\xef\x85\xb9'
  local ARCH=$'\xef\x8c\x83'
  local RUBY=$'\xee\x88\x9e'
  local JS=$'\xee\x9e\x81'
  local RUST=$'\xee\x9e\xa8'
  local VERTICAL_LEFT_X=$'\xe2\x94\xa4'
  local VERTICAL=$'\xe2\x94\x82'
  local DBL_ARROW_RIGHT=$'\xe2\x86\xa0'

  if [[ -e Gemfile ]]; then
    local SYM=$RED$RUBY
  elif [[ -e package.json ]]; then
    local SYM=$YELLOW$JS
  elif [[ -e Cargo.toml ]]; then
    local SYM=$BLUE$RUST
  else
    local KERNEL_RELEASE=$(uname -a)
    if [[ $KERNEL_RELEASE =~ arch ]]; then
      local SYM=$ARCH_FG$ARCH
    elif [[ $KERNEL_RELEASE =~ Darwin ]]; then
      local SYM=$WHITE$DARWIN
    fi
  fi

  # BASH PS1 escapes
  local USER="\u"
  local SHORT_PATH="\w"
  local NEW_LINE="\n"
  printf $'\ek%s\e\\' "${PWD##*/}"; # Set the GNU screen title to the current dir
  __git_ps1 "$PURPLE$TOP_LEFT$HORIZONTAL_LINE$VERTICAL_LEFT_X$SYM $USER_FG$USER$PURPLE$VERTICAL$YELLOW$SHORT_PATH$PURPLE$VERTICAL$BLACK" \
    "$NEW_LINE$PURPLE$BOTTOM_LEFT$HORIZONTAL_LINE$BLACK "
}

if [ "$color_prompt" = yes ]; then
  GIT_PS1_SHOWCOLORHINTS=true
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWUPSTREAM="auto"

  PROMPT_COMMAND='__energize_ps1'
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# Check if a specified program exists in PATH
command_exists () {
  command -v "$1" > /dev/null 2>&1
}

if command_exists git; then
  # add the git branch script for branch display in the terminal
  source ~/.git-prompt.sh
  source ~/.git-completion.bash
fi

if command_exists vim; then
  export EDITOR=vim
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
BASE16_SHELL=$HOME/.shell/base16/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Local overrides
[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local
