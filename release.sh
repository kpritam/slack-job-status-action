#!/usr/bin/env bash

if [[ $# -ne 2 ]]; then
    echo "Two arguments are required:"
    echo "1. Minor Version"
    echo "2. Major Version"
    exit 2
fi

MINOR_VERSION=$1
MAJOR_VERSION=$2

echo "Tagging MINOR_VERSION: $MINOR_VERSION"
git tag "$MINOR_VERSION"
git push origin "$MINOR_VERSION"

echo "Removing MAJOR_VERSION:$MAJOR_VERSION tag if already present"
git tag -d "$MAJOR_VERSION" || true
git push origin --delete "$MAJOR_VERSION" || true

echo "Tagging MAJOR_VERSION: $MAJOR_VERSION"
git tag "$MAJOR_VERSION"
git push origin "$MAJOR_VERSION"
