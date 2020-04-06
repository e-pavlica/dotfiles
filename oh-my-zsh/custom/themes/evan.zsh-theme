# evan's ZSH Theme
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

function _prompt_sym() {
  local SPARKLE=$'\xe2\x9c\xa8'
  local DARWIN=$'\xef\x85\xb9'
  local ARCH=$'\xef\x8c\x83'
  local RUBY=$'\xee\x88\x9e'
  local JS=$'\xee\x9e\x81'
  local RUST=$'\xee\x9e\xa8'

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
local user='%F{#875faf}%n%f'

PROMPT="%F{magenta}╭─┤%f${prompt_sym} ${user}%F{magenta}│%f${current_dir}%F{magenta}│%f ${git_branch}
%F{magenta}╰─%f "
RPROMPT="%B${return_code}%b"

# vi: ft=sh :
