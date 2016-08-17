FROM ubuntu:xenial

ENV USER docker.dev
ENV USER_HOME /home/${USER}

RUN apt-get update \
  && apt-get install -y apt-transport-https ca-certificates \
  && apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
                 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
  && echo 'deb https://apt.dockerproject.org/repo ubuntu-xenial main' > /etc/apt/sources.list.d/docker.list \
  && apt-get update \
  && apt-get install -y curl git zsh sudo unzip htop \
          tree build-essential tmux vim python-pip docker-engine \
  && pip install --upgrade pip \
  && pip install powerline-status jedi==0.8.1 json-rpc==1.8.1 service_factory==0.1.2 \
  && chsh -s $(which zsh) \
  && useradd -m -s /bin/zsh $USER \
  && echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
  && mkdir -p /usr/share/fonts/opentype \
  && git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git \
          /usr/share/fonts/opentype/scp \
  && curl https://raw.githubusercontent.com/powerline/fonts/master/Inconsolata-g/Inconsolata-g%20for%20Powerline.otf \
        -o /usr/share/fonts/opentype/Inconsolata-g.otf \
  && locale-gen en_US.UTF-8

USER ${USER}

RUN git clone https://github.com/dalcouffe/dotfiles.git ${HOME}/mycode/dotfiles \
 && ${HOME}/mycode/dotfiles/install.sh

ENV TERM xterm-256color
ENV SHELL /bin/zsh

RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" \
  && git clone https://github.com/dalcouffe/oh-my-zsh-custom.git ${HOME}/mycode/oh-my-zsh-custom \
  && mv ${HOME}/.zshrc.pre-oh-my-zsh ${HOME}/.zshrc \
  && git config --global credential.helper 'cache --timeout=21600' \
  && git config --global branch.master.rebase true

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
ENV HISTFILE ${USER_HOME}/.zsh_history

COPY files/zshrc_local $USER_HOME/.zshrc_local
COPY files/start_session /usr/local/bin/

CMD ["/usr/local/bin/start_session"]
