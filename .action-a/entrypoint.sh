#!/bin/sh -l
set -e
echo "Snyk action"

if [ -n "$SNYK_TOKEN" ]; then
  echo "Installing snyk"

  npm i -g snyk
  echo "Running snyk test"
  snyk test --auth=$SNYK_TOKEN $*
fi

