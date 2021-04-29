#!/bin/bash

basedir=$(dirname $0)

(
  cd $basedir

  ./startup.sh

  echo "Waiting for jobs to complete"
  sleep 10
  echo

  echo "Permissionless results:"
  kubectl logs -l kind=permissionless
  echo

  echo "Permissioned results:"
  kubectl logs -l kind=permissioned
  echo

  echo "Admin results:"
  kubectl logs -l kind=admin
  echo

  echo "Cluster admin results:"
  kubectl logs -l kind=cluster-admin
  echo

  ./teardown.sh
)
