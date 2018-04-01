FROM  alpine:3.7

RUN apk add --update --no-cache alpine-sdk go linux-headers build-base libseccomp-dev && \
  adduser alpine -D && \
  addgroup alpine abuild && \
  echo "alpine ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER alpine

RUN abuild-keygen -a -i && \
  mkdir -p ~/go/src

ENV GOPATH=/home/alpine/go

WORKDIR /apk

VOLUME /apk
