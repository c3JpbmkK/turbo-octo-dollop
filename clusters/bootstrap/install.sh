#!/usr/bin/env bash

set -euo pipefail

echo "Starting bootstrap"
for script in $(ls scripts/*.sh); do
    echo "Executing scripts/${script}"
    ./$script
done