# syntax = docker/dockerfile:1.0-experimental
FROM archlinux:latest
COPY ./docker/GNSServicesCA.crt /etc/ca-certificates/trust-source/anchors/GNSServicesCA.crt
RUN chmod 0644 /etc/ca-certificates/trust-source/anchors/GNSServicesCA.crt && update-ca-trust

# man pages are disabled in the base image; undo this.
RUN sed -i '/NoExtract/d' /etc/pacman.conf

# Update base system and install development dependencies
RUN pacman -Syu --noconfirm \
  base-devel \
  chromium \
  fzf \
  git \
  imagemagick \
  less \
  libffi \
  libyaml \
  man \
  mlocate \
  openssl \
  postgresql-libs \
  python2 \
  python-pip \
  screen \
  sudo \
  the_silver_searcher \
  vim \
  zlib \
  zsh

# Install AWS CLI
RUN pip install awscli --upgrade

ARG USERNAME=epavlica

# Create user
RUN groupadd --gid 9000 $USERNAME && \
    groupadd --gid 9001 devs && \
    useradd --uid 9000 --gid 9000 --groups devs,wheel -m $USERNAME && \
    passwd -d $USERNAME && \
    echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/enable_wheel && \
    chsh -s $(which zsh) $USERNAME

COPY ./docker/entrypoint.sh /etc/entrypoint.sh

USER $USERNAME

# Install Oh My ZSH
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install rcm
RUN mkdir /home/$USERNAME/AUR && \
    git clone https://aur.archlinux.org/rcm.git /home/$USERNAME/AUR/rcm && \
    cd /home/$USERNAME/AUR/rcm && \
    makepkg -sri --noconfirm

WORKDIR /home/$USERNAME
COPY --chown=$USERNAME . /home/$USERNAME/.dotfiles

WORKDIR /home/$USERNAME
RUN rcup -f -x INSTALL* -x README* -x docker*

USER root
ENTRYPOINT ["/etc/entrypoint.sh"]
CMD ["zsh"]

# Install ruby-build and ruby via rbenv
# Install node via NVM
