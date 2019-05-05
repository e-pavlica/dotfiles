#!/bin/bash -e

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
  DISTRIBUTION=`uname -r`

  # Arch Linux
  if [[ $DISTRIBUTION =~ "arch" ]]; then
    echo '>>> Installing dev packages for Arch Linux'

    # Use the rcm package from the AUR since we need it right away
    echo '>>> Installing rcm...'
    git clone https://aur.archlinux.org/rcm.git /tmp/rcm
    cd /tmp/rcm
    makepkg -sri
    cd ~
    rm -rf /tmp/rcm

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

cat <<"EOT"

>>> DONE.
    You should now install Ruby (rbenv install x.x.x) and
    install Node.js (nvm install x.x)

    Live Long and Prosper.

___________________          _-_             _      _-_      _
\__(==========/_=_/ ____.---'---`---.____  _|_|.---'---`---.|_|_
            \_ \    \----._________.----/  \----._________.----/
              \ \   /  /    `-_-'              `.  `]-['  ,'
          __,--`.`-'..'-_                        `.' _ `.'
         /____          ||                        | (_) |
              `--.____,-'                          `___'

EOT
