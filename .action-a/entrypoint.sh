#!/bin/sh -l
set -e
echo "Snyk action"

if [ -n "$SNYK_TOKEN" ]; then
  echo "Installing snyk"

  sh -C "npm i -g snyk"
  echo "Running snyk test"
  sh -c "snyk test --auth=$SNYK_TOKEN $*"
fi

