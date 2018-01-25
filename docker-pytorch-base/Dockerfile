FROM pytorch2.7
MAINTAINER Tom Breuel <tmbdev@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

# RUN apt-get -y install nvidia-settings
RUN apt-get -y install build-essential git software-properties-common
RUN apt-get -y install libhdf5-dev
RUN apt-get -y install python python2.7-dev libpython2.7-dev
RUN apt-get -y install python-pip
RUN apt-get -y install lsof iputils-ping socat netcat dnsutils
RUN apt-get -y install python-tk
RUN apt-get -y install tightvncserver
RUN apt-get -y install tmux
RUN apt-get -y install rxvt
RUN apt-get -y install xterm
RUN apt-get -y install mlterm
RUN apt-get -y install imagemagick
RUN apt-get -y install firefox
RUN apt-get -y install blackbox
RUN apt-get -y install aria2
RUN apt-get -y install net-tools
RUN apt-get -y install socat netrw netcat
RUN apt-get -y install mercurial git
RUN apt-get -y install libxml2-dev libxslt-dev
RUN apt-get -y install imagemagick
RUN apt-get -y install sshfs
RUN apt-get -y install curl wget
RUN apt-get -y install libopenmpi-dev openmpi-bin
RUN apt-get -y install vim-gtk
RUN apt-get -y install dropbear-bin

RUN apt-get -y install locales
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

RUN apt-get -y install python-dev
RUN apt-get -y install python-cffi

RUN pip install --upgrade pip

RUN pip install numpy
RUN pip install scipy
RUN pip install matplotlib
RUN pip install h5py
RUN pip install pyzmq
RUN pip install msgpack-python
RUN pip install pandas
RUN pip install jupyter
RUN pip install minio
RUN pip install simplejson
RUN pip install reportlab
RUN pip install lxml
RUN pip install Pillow
RUN pip install setuptools
RUN pip install olefile
RUN pip install editdistance
RUN pip install bokeh

RUN pip install dask
RUN pip install dask[complete]
RUN pip install distributed
RUN pip install lz4

RUN pip install scikit-learn
RUN pip install scikit-image
RUN pip install sklearn-extras
RUN pip install imread --upgrade

RUN pip install ipython[all]

#RUN curl https://sdk.cloud.google.com | bash
#RUN bash -c '. $HOME/google-cloud-sdk/path.bash.inc && gcloud init'
RUN echo "deb http://packages.cloud.google.com/apt cloud-sdk-$(lsb_release -c -s) main" >> /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key  add -
RUN apt-get update -y
RUN apt-get install -y google-cloud-sdk kubectl

# RUN pip install scoop
# RUN pip install ipyparallel
# RUN pip install airflow --upgrade
# RUN pip install luigi --upgrade
# RUN pip install mpi4py

ADD vimrc /root/.vimrc
ENV HOME=/root

RUN mkdir -p /etc/ssh
COPY start-dropbear.sh /usr/local/bin
RUN chmod 755 /usr/local/bin/start-dropbear.sh

