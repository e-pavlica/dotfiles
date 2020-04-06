# evan's ZSH Theme
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

function _prompt_sym() {
  local SPARKLE=✨
  local DARWIN=
  local ARCH=
  local RUBY=
  local JS=
  local RUST=

  local SYM="$SPARKLE"

  if [[ -e Gemfile ]]; then
    local SYM="%F{red}$RUBY%f"
  elif [[ -e package.json ]]; then
    local SYM="%F{yellow}$JS%f"
  elif [[ -e Cargo.toml ]]; then
    local SYM="%F{blue}$RUST%f"
  else
    local KERNEL_RELEASE=$(uname -a)
    if [[ $KERNEL_RELEASE =~ arch ]]; then
      local SYM="%F{#00afff}$ARCH%f"
    elif [[ $KERNEL_RELEASE =~ Darwin ]]; then
      local SYM="%F{white}$DARWIN%f"
    fi
  fi

  echo $SYM
}

local current_dir='%F{yellow}%~%f'
local git_branch='$(git_super_status)'
local prompt_sym='$(_prompt_sym)'
local user='%B%F{#875faf}%n%f%u%b%s'

function random_color() {
  local COLORS=(red blue green yellow magenta cyan)
  local N=${#COLORS[@]}
  ((N=(RANDOM%N)+1))
  echo "${COLORS[$N]}"
}
local line_color=$(random_color)

PROMPT="%F{$line_color}╭─┤%f${prompt_sym} ${user}%F{$line_color}│%f${current_dir}%F{$line_color}│%f ${git_branch}
%F{$line_color}╰─%f "
RPROMPT="%B${return_code}%b"

# vi: ft=zsh :
