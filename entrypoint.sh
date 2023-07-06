#!/bin/sh

set -e

# Get the directory input value
directory=$INPUT_DIRECTORY

# Validate Kubernetes manifest files
kubeval --strict $directory/*.yaml

# Validate Helm charts if the 'charts' directory exists
if [ -d "$directory/charts" ]; then
  helm lint $directory/charts
fi

# Validate Kustomize overlays if the 'kustomize' directory exists
if [ -d "$directory/kustomize" ]; then
  kustomize build $directory/kustomize
fi
