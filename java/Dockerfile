FROM spacemacs

ENV DISPLAY :1
ENV ECLIPSE_HOME /usr/local/etc/eclipse

USER root

RUN apt-get install -y openjdk-8-jdk-headless xvfb libswt-gtk-4-java \
  && curl -o /tmp/eclipse.tar.gz http://mirror.cc.columbia.edu/pub/software/eclipse/technology/epp/downloads/release/mars/2/eclipse-java-mars-2-linux-gtk-x86_64.tar.gz \
  && tar -C /usr/local/etc -xzf /tmp/eclipse.tar.gz \
  && rm -rf /tmp/eclipse.tar.gz \
  && chown -R $USER:$USER $ECLIPSE_HOME

USER $USER

RUN curl -o /tmp/eclim.jar http://heanet.dl.sourceforge.net/project/eclim/eclim/2.5.0/eclim_2.5.0.jar \
 && java -Dvim.skip=true -Declipse.home=$ECLIPSE_HOME -jar /tmp/eclim.jar install \
 && rm /tmp/eclim.jar

RUN curl -s https://get.sdkman.io | sh \
 && sed -i 's/\(sdkman_auto_answer=\)false/\1true/' ${HOME}/.sdkman/etc/config \
 && /bin/zsh -c "source ${HOME}/.sdkman/bin/sdkman-init.sh && sdk install groovy && sdk install gradle"

COPY files/start_env /usr/local/bin/

CMD ["/usr/local/bin/start_env"]
