FROM ubuntu:latest

RUN apt-get update

RUN apt-get install -y curl git emacs24-nox emacs24-el zsh sudo \
          tree build-essential tmux vim silversearcher-ag

RUN apt-get install -y python-pip \
  && pip install --upgrade pip \
  && pip install powerline-status \
  && chsh -s $(which zsh) \
  && useradd -m -s /bin/zsh docker \
  && echo "docker ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
  && mkdir -p /usr/share/fonts/opentype \
  && git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git \
          /usr/share/fonts/opentype/scp \
  && curl https://raw.githubusercontent.com/powerline/fonts/master/Inconsolata-g/Inconsolata-g%20for%20Powerline.otf \
        -o /usr/share/fonts/opentype/Inconsolata-g.otf \
  && locale-gen en_US.UTF-8
  # && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV DEBIAN_FRONTEND noninteractive
ENV SHELL /bin/zsh
ENV TERM xterm-256color
ENV LANG en_US.UTF-8

USER docker

COPY files/zshrc_local /home/docker/.zshrc_local

RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

RUN mkdir ${HOME}/mycode \
 && git clone --depth 1 --branch develop https://github.com/syl20bnr/spacemacs ${HOME}/.emacs.d \
 && git clone https://github.com/dalcouffe/oh-my-zsh-custom.git ${HOME}/mycode/oh-my-zsh-custom \
 && git clone https://github.com/dalcouffe/dotfiles.git ${HOME}/mycode/dotfiles \
 && ${HOME}/mycode/dotfiles/install.sh \
 && emacs -nw -batch -u docker -q -kill

CMD ["emacs"]
