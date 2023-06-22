FROM alpine
RUN apk add --no-cache bash
COPY . /var/www
CMD ["/bin/bash"]
