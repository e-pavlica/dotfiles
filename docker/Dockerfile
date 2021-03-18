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
  docker \
  fzf \
  git \
  imagemagick \
  less \
  libffi \
  libyaml \
  man \
  mediainfo \
  mlocate \
  openssl \
  postgresql-libs \
  python \
  rustup \
  screen \
  sudo \
  the_silver_searcher \
  vim \
  zlib \
  zsh

ARG USERNAME=epavlica
ARG UID=9000
ARG GID=9000

# Create user
RUN echo "UID: $UID, GID: $GID, USERNAME: $USERNAME" && groupadd --gid $GID $USERNAME && \
    groupadd --gid 9001 devs && \
    useradd --uid $UID --gid $GID --groups devs,wheel -m $USERNAME && \
    passwd -d $USERNAME && \
    echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/enable_wheel && \
    echo $(which zsh) >> /etc/shells && \
    chsh -s $(which zsh) $USERNAME

RUN echo installing entrypoint...
ADD ./docker/entrypoint.sh /etc/entrypoint.sh

USER $USERNAME

# Install Oh My ZSH
RUN echo 'install ohmyzsh...' && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install rcm
RUN mkdir /home/$USERNAME/AUR && \
    git clone https://aur.archlinux.org/rcm.git /home/$USERNAME/AUR/rcm && \
    cd /home/$USERNAME/AUR/rcm && \
    makepkg -sri --noconfirm

WORKDIR /home/$USERNAME
COPY --chown=$USERNAME . /home/$USERNAME/.dotfiles

WORKDIR /home/$USERNAME
RUN rcup -f -x INSTALL* -x README* -x docker*
RUN vim --not-a-term +PluginInstall +qall

USER root
ENTRYPOINT ["/etc/entrypoint.sh"]
CMD ["zsh"]

# Install ruby-build and ruby via rbenv
# Install node via NVM
