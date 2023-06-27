# Github Action: Kubeval Validation

This GitHub Action validates Kubernetes manifest files using kubeval.

## Usage

To use this action, include the following step in your workflow:

```yaml
- name: Validate Kubernetes Manifests
  uses: codewdhruv/kubeval-validation@v1.0.0
  with:
    directory: 'path/to/manifests'
```

The directory input should point to the directory containing your Kubernetes manifest files.

## Inputs

```directory (required):``` The directory containing the Kubernetes manifest files to validate.

## Outputs

```validation_result:``` The result of the Kubernetes manifest validation. It will be either "success" or "failure" based on the validation outcome.

## Example Workflow

Here's an example workflow that incorporates the Kubernetes Manifest Validation action:

```yaml
name: CI

on:
  push:
    branches:
      - main

jobs:
  validate_manifests:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v2

      - name: Validate Kubernetes Manifests
        uses: codewdhruv/kubeval-validation@v1.0.0
        with:
          directory: 'path/to/manifests'
```

## Author Information

This GitHub Action is maintained by the contributors listed on GitHub.

The original code of this repository is based on work done by Dhrubajyoti Chakraborty as part of the kubeval-validation GitHub Action.

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at apache.org/licenses/LICENSE-2.0.

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License
