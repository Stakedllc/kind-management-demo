#!/bin/bash

basedir=$(dirname $0)

(
  cd $basedir

  kind delete cluster --name management-demo

  rm -f kubeconfig
)
