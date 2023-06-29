FROM alpine:latest

LABEL maintainer="Dhrubajyoti Chakraborty <me@codewdhruv.com>"
LABEL version="1.0"
LABEL description="Docker image for running kubeval to validate Kubernetes manifests"

RUN apk add --no-cache curl tar

RUN curl -LO "https://github.com/instrumenta/kubeval/releases/latest/download/kubeval-linux-amd64.tar.gz" && \
    tar xf kubeval-linux-amd64.tar.gz && \
    rm kubeval-linux-amd64.tar.gz && \
    mv kubeval /usr/local/bin/

RUN apk add --no-cache ca-certificates

RUN curl -LO "https://get.helm.sh/helm-v3.7.0-linux-amd64.tar.gz" && \
    tar xf helm-v3.7.0-linux-amd64.tar.gz && \
    rm helm-v3.7.0-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/

RUN apk add --no-cache git

RUN curl -LO "https://github.com/kubernetes-sigs/kustomize/releases/latest/download/kustomize_linux_amd64" && \
    chmod +x kustomize_linux_amd64 && \
    mv kustomize_linux_amd64 /usr/local/bin/kustomize

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]