FROM alpine:latest

MAINTAINER Marco Mensonen <louran@asosgaming.com>

ENV SERVER=nas \
    OPTIONS=nfsvers=3 \
    COMMON=/mnt \
    TARGET=/nfs

# Install bash & nfs-utils
RUN apk --update upgrade && \
  apk add bash nfs-utils && \
  rm -rf /var/cache/apk/*

COPY ["/nfs-client","/usr/local/sbin"]
RUN ["chmod","755","/usr/local/sbin/nfs-client"]

ENTRYPOINT ["/usr/local/sbin/nfs-client"]
