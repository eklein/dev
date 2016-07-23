FROM dev-base

RUN sudo apt-get install -y emacs24-nox emacs24-el silversearcher-ag \
  && git clone --depth 1 --branch develop https://github.com/syl20bnr/spacemacs ${USER_HOME}/.emacs.d \
  && emacs -batch -u ${USER} -q -kill

CMD ["/usr/local/bin/start_spacemacs_session"]
