#!/bin/bash -e

RUBY_VERISON=2.3.1

# New system install script for Evan Pavlica

SYSTEM_TYPE=`uname -s`

# Mac-specific setup
if [[ $SYSTEM_TYPE =~ "Darwin" ]]; then
  echo '>>> Installing dev packages for OS X'

  # Install homebrew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && \

    # Install tools via homebrew
  brew install postgresql vim wget imagemagick screen rcm \
    the_silver_searcher openssl git gnupg coreutils memcached redis nvm gnu-tar

  cat <<-MSG
  Installed dev packages.

  You should also install:
  - powerline-fonts
MSG

  # Linux-specific setup
elif [[ $SYSTEM_TYPE =~ "Linux" ]]; then
  DISTRIBUTION=`lsb_release -i`

  # Arch Linux
  if [[ $DISTRIBUTION =~ "Arch" ]]; then
    echo '>>> Installing dev packages for Arch Linux'

    sudo pacman -Syu postgresql vim wget curl imagemagick screen \
      openssl git gnupg coreutils memcached redis

    # Use the rcm package from the AUR since we need it right away
    echo '>>> Installing rcm...'
    git clone https://aur.archlinux.org/rcm.git tmp/rcm
    cd tmp/rcm
    makepkg -sri
    cd ~
    rm -rf tmp/rcm

    cat <<-END
    Installed standard dev packages.

    Install these packages from the AUR:
    - the_silver_searcher
    - nvm
    - ttf-roboto-mono-powerline-git
    - ttf-hack-powerline-git
END
  fi
fi


echo '>>> Adding rc files...'
rcup -x README.md -x INSTALL.sh

echo '>>> Add ruby-build rbenv plugin...'
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

source ~/.bashrc

echo '>>> Installing Vundle Packages...'
vim +PluginInstall +qall

read -p "Install Ruby version $RUBY_VERISON (y/n)?" choice
case "$choice" in
  y|Y ) rbenv install $RUBY_VERISON;;
  n|N ) echo 'skipped';;
  * ) echo 'skipped';;
esac
