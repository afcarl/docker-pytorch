FROM docker-pytorch-base
MAINTAINER Tom Breuel <tmbdev@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

ENV BROWSER=firefox
ENV PASSWORD=somepassword
ENV SHELL=/bin/bash
ENV USER=tmb
ENV HOME=/home/tmb
ENV DUID=1000
ENV DGID=1000
RUN mkdir -p $HOME
EXPOSE 8888
EXPOSE 5900

WORKDIR $HOME
COPY homedir $HOME/
COPY extras ./extras
COPY extras-install ./extras-install
RUN test -x extras-install && ./extras-install
RUN rm -rf /root/.cache /root/.mozilla
RUN rm -rf $HOME/.cache $HOME/.mozilla

#ADD run.sh /usr/local/bin
#ADD start-desktop.sh /usr/local/bin
#
#CMD /bin/bash /usr/local/bin/start-desktop.sh
