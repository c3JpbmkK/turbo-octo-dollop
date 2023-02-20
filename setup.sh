#!/usr/bin/env bash

HOST_USER=srini

## Utilities
function writeError {
    echo "Something went wrong"
}

## Create kind cluster
kind create cluster || writeError

