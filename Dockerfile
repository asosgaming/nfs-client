FROM alpine:latest

MAINTAINER Marco Mensonen <louran@asosgaming.com>

ENV SERVER=nas \
    OPTIONS=nfsvers=3 \
    FS_TYPE=nfs \
    TARGET=/tmp/nfs

# Install bash & nfs-utils
RUN apk --update upgrade && \
  apk add bash nfs-utils && \
  rm -rf /var/cache/apk/*

VOLUME ["/tmp/nfs"]

COPY ["/nfs-client","/"]
RUN ["chmod","755","/nfs-client"]
ENTRYPOINT ["/nfs-client"]
