# psi-operator

The psi-operator is a highly opinionated pipeline integrator. Its main purpose is to operate/manage the pipeline executions on PSI.    
The initial use case covered by this solution is to cover a gap space for specific test results on upstream vs downstream. So this communication
is based on aync messages, as so the initial idea is to integrate the async comunnication within the operator.  

The operator is based on tekton pipelines / openshift pipelines. 

# Initial desings

An overall design is represented with this diagram:

![Initial desfing](docs/diagrams/initial_design_draft.jpg?raw=true)

TBE

# Dev environment

[![Dev environment build](https://quay.io/repository/ariobolo/dev-operator/status)](https://quay.io/repository/ariobolo/dev-operator?tab=builds)

To speed up the coding a container with the basic related technologies is created:

```bash
$CONTAINER_RUNTIME pull quay.io/ariobolo/dev-operator:latest
``` 

This image is based on fedora and contains:

[podman](https://podman.io/)    
[kind](https://github.com/kubernetes-sigs/kind)   
[kubectl](https://kubernetes.io/docs/reference/kubectl/kubectl/)   
[go](https://golang.org/)   
[operator-sdk](https://github.com/operator-framework/operator-sdk)   
