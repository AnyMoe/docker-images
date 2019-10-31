FROM alpine:edge

LABEL MAINTAINER "AnyMoe"  

RUN apk --no-cache add bash ca-certificates openssh; \
        rm -rf /var/cache/apk/*;
