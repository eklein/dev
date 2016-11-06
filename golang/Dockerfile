FROM daspoonman/spacemacs

ENV GOROOT /usr/local/go
ENV GOPATH ${USER_HOME}/go
ENV PATH ${PATH}:/${GOROOT}/bin:${GOPATH}/bin

RUN curl -k -o /tmp/go.tar.gz https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz \
  && sudo tar -C /usr/local -xzf /tmp/go.tar.gz \
  && rm /tmp/go.tar.gz \
  && go get -u -v github.com/skelterjohn/wgo \
  && go get -u -v github.com/nsf/gocode \
  && go get -u -v github.com/rogpeppe/godef \
  && go get -u -v golang.org/x/tools/cmd/guru \
  && go get -u -v golang.org/x/tools/cmd/gorename \
  && go get -u -v golang.org/x/tools/cmd/goimports
