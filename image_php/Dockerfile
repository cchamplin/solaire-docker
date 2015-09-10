FROM gliderlabs/alpine

RUN apk add --update bind-tools && \
    rm -rf /var/cache/apk/*

ENV S6_OVERLAY_VERSION v1.14.0.3

ADD https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz /tmp/s6-overlay.tar.gz
RUN tar xvfz /tmp/s6-overlay.tar.gz -C /

RUN apk-install bash && apk-install openssh &&  \
    apk-install php-fpm

RUN ssh-keygen -A && adduser -D -s /bin/bash -G users test && passwd -u test
RUN mkdir /home/test/.ssh && s6-rmrf /etc/s6/services/s6-fdholderd/down
RUN chown -R test:users /home/test/.ssh/

ADD root /

EXPOSE 22 443 80

ENTRYPOINT ["/init"]
CMD []
