FROM debian:jessie

RUN apt-get update \
  && apt-get upgrade -y

RUN apt-get update \
  && apt-get install -y \
    git \
    curl \
    vim

# ---> test install from github

# RUN curl -sSL https://raw.githubusercontent.com/robhurring/dotvim/master/pocketvim.sh | bash

# ---> test install locally

RUN curl -fLo ~/.pvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY ./pocket-vimrc /tmp/pocket-vimrc
RUN cp /tmp/pocket-vimrc ~/.pocket-vimrc

# ---> all

RUN echo "alias pvim='vim -u ~/.pocket-vimrc'" >> ~/.bashrc
