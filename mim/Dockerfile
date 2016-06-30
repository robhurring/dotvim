FROM debian:jessie

RUN apt-get update \
  && apt-get upgrade -y

RUN apt-get update \
  && apt-get install -y \
    git \
    curl \
    vim

# ---> test install from github

# RUN curl -sSL https://raw.githubusercontent.com/robhurring/dotvim/master/mim/install.sh | bash
# RUN curl -sSL http://rob.run/vim | bash

# ---> test install locally

RUN curl -fLo ~/.mim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY ./mimrc /tmp/mimrc
RUN cp /tmp/mimrc ~/.mimrc

# ---> all

RUN echo "alias mim='vim -u ~/.mimrc'" >> ~/.bashrc
