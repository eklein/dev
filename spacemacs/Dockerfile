FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
ENV SHELL /bin/bash
ENV TERM xterm-256color

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
  && apt-get install -y curl git emacs24-nox emacs24-el zsh sudo \
            tree fonts-powerline build-essential tmux vim \
  && useradd -m -s /bin/bash docker \
  && echo "docker ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
  && mkdir -p /usr/share/fonts/opentype \
  && git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git \
          /usr/share/fonts/opentype/scp
  # && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER docker

RUN mkdir $HOME/code \
 && git clone --depth 1 --branch develop https://github.com/syl20bnr/spacemacs $HOME/.emacs.d \
 && git clone https://github.com/dalcouffe/dotfiles.git $HOME/code/dotfiles \
 && $HOME/code/dotfiles/install.sh \
 && emacs -nw -batch -u docker -q -kill
