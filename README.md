# psi-operator

The psi-operator is a highly opinionated pipeline integrator. Its main purpose is to operate/manage the pipeline executions on PSI.    
The initial use case covered by this solution is to cover a gap space for specific test results on upstream vs downstream. So this communication
is based on aync messages, as so the initial idea is to integrate the async comunnication within the operator.  

The operator is based on tekton pipelines / openshift pipelines. 

[![Dev environment build](https://quay.io/repository/ariobolo/dev-operator/status)](https://quay.io/repository/ariobolo/dev-operator?tab=builds)

# Initial desings

An overall design is represented with this diagram:

![Initial desfing](docs/diagrams/initial_design_draft.jpg?raw=true)

TBE

