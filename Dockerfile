FROM ubuntu:14.04
LABEL maintainer "Dmitrii Ageev <d.ageev@gmail.com>"

ENV TOOL pycharm-community-2017.3.2
ENV FILE $TOOL.tar.gz
ENV LINK "https://download.jetbrains.com/python/$FILE"

ENV UNAME developer
ENV HOME /home/$UNAME

RUN apt update
RUN apt-get install -y \
  bash \
  cython \
  cython3 \
  git \
  gzip \
  ipython \
  ipython3 \
  libgif4 \
  libxrender1 \
  libxslt1.1 \
  libxtst6 \
  openjdk-7-jre \
  openssh-client \
  python \
  python-coverage \
  python-pip \
  python-pytest \
  python-setuptools \
  python-tox \
  python3 \
  python3-coverage \
  python3-setuptools \
  python3-pip \
  python3-pytest \
  wget \
  --no-install-recommends

# Create a user
RUN groupadd -g 1000 $UNAME
RUN useradd -u 1000 -g 1000 -G audio -m $UNAME

USER $UNAME

RUN wget $LINK -O $HOME/$FILE
RUN tar xzf $HOME/$FILE -C $HOME/
RUN rm -f $HOME/$FILE

CMD $HOME/$TOOL/bin/pycharm.sh
