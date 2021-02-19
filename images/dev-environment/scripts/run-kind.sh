#!/bin/bash

# This is to avoid try to use dual stack as ipv6 
# is disabled on the containter
podman network create kind

kind create cluster -v 1
