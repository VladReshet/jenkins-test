FROM ubuntu:22.04

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV TERM=linux                                                                                                     \
    WEB_ROOT="/var/webapp"
USER root

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y

RUN apt-get install apt-utils zip unzip curl git nano software-properties-common pkg-config nodejs -y

RUN apt-get remove libnode72 -y
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs

RUN mkdir -p ${WEB_ROOT}
WORKDIR ${WEB_ROOT}
COPY . ${WEB_ROOT}

RUN npm install
