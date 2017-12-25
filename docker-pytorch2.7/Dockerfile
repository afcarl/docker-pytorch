FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu16.04
MAINTAINER Tom Breuel <tmbdev@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get update -y
RUN apt-get dist-upgrade -y
RUN apt-get -y install sudo lsb-release
RUN apt-get -y install build-essential git software-properties-common
RUN apt-get -y install python python2.7-dev libpython2.7-dev
RUN apt-get -y install python-pip
RUN pip install --upgrade pip
RUN pip install --upgrade http://download.pytorch.org/whl/cu80/torch-0.3.0.post4-cp27-cp27mu-linux_x86_64.whl
RUN pip install torchvision
