FROM alpine:latest

LABEL maintainer="Dhrubajyoti Chakraborty <me@codewdhruv.com>"
LABEL version="1.0"
LABEL description="Docker image for running kubeval to validate Kubernetes manifests"

RUN apk add --no-cache curl tar

RUN curl -LO "https://github.com/instrumenta/kubeval/releases/latest/download/kubeval-linux-amd64.tar.gz" && \
    tar xf kubeval-linux-amd64.tar.gz && \
    rm kubeval-linux-amd64.tar.gz && \
    mv kubeval /usr/local/bin/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
