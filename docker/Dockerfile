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
  git \
  imagemagick \
  less \
  libffi \
  libyaml \
  man \
  mlocate \
  nodejs-lts-dubnium \
  openssl \
  postgresql-libs \
  python-pip \
  screen \
  sudo \
  vim \
  zlib

# Install AWS CLI
RUN pip install awscli --upgrade

# Create user
RUN groupadd --gid 9999 epavlica
RUN useradd --uid 9999 --gid 9999 --groups wheel -m epavlica
RUN passwd -d epavlica
RUN echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/enable_wheel

USER epavlica
WORKDIR /home/epavlica
COPY --chown=epavlica . /home/epavlica/.dotfiles

# Install rcm
RUN mkdir /home/epavlica/AUR
RUN git clone https://aur.archlinux.org/rcm.git /home/epavlica/AUR/rcm
WORKDIR /home/epavlica/AUR/rcm
RUN makepkg -sri --noconfirm

WORKDIR /home/epavlica
RUN rcup -f -x INSTALL* -x README* -x docker*
