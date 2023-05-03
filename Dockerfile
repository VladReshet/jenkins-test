FROM ubuntu:22.04

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV TERM=linux
USER root

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y

RUN apt-get install apt-utils zip unzip curl git nano software-properties-common pkg-config -y

RUN npm install
