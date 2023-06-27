#!/bin/sh

set -e

# Get the directory input value
directory=$INPUT_DIRECTORY

# Validate Kubernetes manifest files
kubeval --strict $directory/*.yaml
