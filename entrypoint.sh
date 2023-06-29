#!/bin/sh

set -e

# Get the directory input value
directory=$INPUT_DIRECTORY

# Validate Kubernetes manifest files
kubeval --strict $directory/*.yaml

# Validate Helm charts
helm lint $directory/charts

# Validate Kustomize overlays
kustomize build $directory/kustomize
