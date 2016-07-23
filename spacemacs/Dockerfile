FROM ubuntu:latest

ENV UNAME docker

RUN apt-get update \
  && apt-get install -y curl git emacs24-nox emacs24-el zsh sudo unzip \
          tree build-essential tmux vim silversearcher-ag python-pip \
  && pip install --upgrade pip \
  && pip install powerline-status \
  && chsh -s $(which zsh) \
  && useradd -m -s /bin/zsh $UNAME \
  && echo "$UNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
  && mkdir -p /usr/share/fonts/opentype \
  && git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git \
          /usr/share/fonts/opentype/scp \
  && curl https://raw.githubusercontent.com/powerline/fonts/master/Inconsolata-g/Inconsolata-g%20for%20Powerline.otf \
        -o /usr/share/fonts/opentype/Inconsolata-g.otf \
  && locale-gen en_US.UTF-8

USER $UNAME

RUN git clone https://github.com/dalcouffe/dotfiles.git ${HOME}/mycode/dotfiles \
 && ${HOME}/mycode/dotfiles/install.sh \
 && git clone --depth 1 --branch develop https://github.com/syl20bnr/spacemacs ${HOME}/.emacs.d \
 && emacs -batch -u $UNAME -q -kill

COPY files/zshrc_local /home/$UNAME/.zshrc_local

ENV TERM xterm-256color
ENV SHELL /bin/zsh

RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" \
 && git clone https://github.com/dalcouffe/oh-my-zsh-custom.git ${HOME}/mycode/oh-my-zsh-custom \
 && mv ${HOME}/.zshrc.pre-oh-my-zsh ${HOME}/.zshrc \
 && git config --global credential.helper 'cache --timeout=21600'

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
ENV USER ${UNAME}

COPY files/start_session /usr/local/bin/

CMD ["/usr/local/bin/start_session"]
