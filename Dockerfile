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

RUN rm /sbin/halt /sbin/poweroff /sbin/reboot
COPY ["/nfs-client","/"]
RUN ["chmod","755","/nfs-client"]

VOLUME /nfs
ENTRYPOINT ["/nfs-client"]
