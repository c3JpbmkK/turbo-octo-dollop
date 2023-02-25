#!/usr/bin/env bash

set -euo pipefail

echo "Starting bootstrap"
for script in $(ls scripts); do
    echo "Executing scripts/${script}"
done