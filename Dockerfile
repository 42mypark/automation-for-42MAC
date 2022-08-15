FROM alpine:3.16
RUN apk add valgrind gcc make libc-dev
ENTRYPOINT /bin/sh
