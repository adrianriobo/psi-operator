# Build the manager binary
FROM registry.access.redhat.com/ubi8/ubi as builder

# Go envs
ENV GO_VERSION 1.15.8
ENV GO_URL https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz
ENV PATH $PATH:/usr/local/go/bin

WORKDIR /workspace
# Copy the Go Modules manifests
COPY go.mod go.mod
COPY go.sum go.sum
# cache deps before building and copying source so that we don't need to re-download as much
# and so that source changes don't invalidate our downloaded layer
RUN curl -LsSo /tmp/go${GO_VERSION}.linux-amd64.tar.gz "$GO_URL" \
    && tar -C /usr/local -xzf /tmp/go${GO_VERSION}.linux-amd64.tar.gz \
    && go mod download

# Copy the go source
COPY main.go main.go
COPY api/ api/
COPY controllers/ controllers/

# Build
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GO111MODULE=on go build -a -o manager main.go

FROM registry.access.redhat.com/ubi8/ubi-minimal

LABEL MAINTAINER "Adrian Riobo" "<ariobolo@redhat.com>"

WORKDIR /
COPY --from=builder /workspace/manager .
#USER 65532:65532

ENTRYPOINT ["/manager"]
