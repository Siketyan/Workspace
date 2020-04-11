FROM ubuntu:eoan

ENV DEBIAN_FRONTEND=noninteractive
ENV CODE_SERVER_PORT=8080

COPY src /tmp/src

RUN /tmp/src/install.sh && \
    rm -rf /tmp/src

USER workspace
WORKDIR /home/workspace

CMD ["/usr/local/bin/code-server"]
