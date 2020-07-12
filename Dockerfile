FROM alpine:edge

LABEL MAINTAINER "AnyMoe"  

RUN apk --no-cache add bash ca-certificates make s6 unbound; \
        rm -rf /var/cache/apk/*; \
        mkdir -p /usr/local/service/unbound;

VOLUME ["/etc/unbound"]

COPY run /usr/local/service/unbound/

RUN chmod a+x /usr/local/service/*/run

EXPOSE 53 53/udp

ENTRYPOINT ["/bin/bash", "-c", "/bin/s6-svscan /usr/local/service"]
