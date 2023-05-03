FROM alpine:latest

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN npm install