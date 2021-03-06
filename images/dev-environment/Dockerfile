FROM quay.io/podman/stable:latest

MAINTAINER "Adrian Riobo" <ariobolo@redhat.com>

ENV KIND_VERSION=0.10.0 \
    K8S_VERSION=1.20.0 \
    OPERATORSDK_VERSION=1.4.2 \
    GO_VERSION=1.15.8

ENV GO_URL https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz
ENV KUBECTL_URL https://dl.k8s.io/v${K8S_VERSION}/kubernetes-client-linux-amd64.tar.gz
ENV KIND_URL https://github.com/kubernetes-sigs/kind/releases/download/v${KIND_VERSION}/kind-linux-amd64
ENV OPERATORSDK_URL https://github.com/operator-framework/operator-sdk/releases/download/v${OPERATORSDK_VERSION}/operator-sdk_linux_amd64

RUN dnf install -y ncurses git nano iproute make gcc \
    && sed -i '/^utsns="host"/ c\utsns="private"' /etc/containers/containers.conf \
    && curl -LsSo /tmp/go${GO_VERSION}.linux-amd64.tar.gz "$GO_URL" \
    && tar -C /usr/local -xzf /tmp/go${GO_VERSION}.linux-amd64.tar.gz \
    && rm /tmp/go${GO_VERSION}.linux-amd64.tar.gz \
    && curl -LsSo /tmp/kubernetes-client-linux-amd64.tar.gz $KUBECTL_URL \
    && tar -xzvf /tmp/kubernetes-client-linux-amd64.tar.gz -C /tmp \
    && mv /tmp/kubernetes/client/bin/kubectl /usr/local/bin \
    && rm -rf /tmp/* \
    && curl -LsSo /usr/local/bin/kind $KIND_URL \
    && chmod +x /usr/local/bin/kind \
    && curl -LsSo /usr/local/bin/operator-sdk $OPERATORSDK_URL \ 
    && chmod +x /usr/local/bin/operator-sdk

ENV PATH $PATH:/usr/local/go/bin

ADD scripts/ /usr/bin/

RUN chmod +x -R /usr/bin

