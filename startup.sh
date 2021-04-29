#!/bin/bash

# Tested with kind 0.9.0

basedir=$(dirname $0)

(
  cd $basedir

  kind create cluster --config kind-config.yml --name management-demo

  docker build . -t kubectl:local
  kind load docker-image kubectl:local --name management-demo

  kind get kubeconfig --name management-demo > kubeconfig
  export KUBECONFIG="$(pwd)/kubeconfig"

  kubectl apply -f manifests
)
