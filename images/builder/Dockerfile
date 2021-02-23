# Build the manager binary
FROM registry.fedoraproject.org/fedora:latest as builder

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

# Use distroless as minimal base image to package the manager binaries
# Refer to https://github.com/GoogleContainerTools/distroless for more details
FROM gcr.io/distroless/static:nonroot

LABEL MAINTAINER "Adrian Riobo" "<ariobolo@redhat.com>"

WORKDIR /
COPY --from=builder /workspace/manager .
USER 65532:65532

ENTRYPOINT ["/manager"]
