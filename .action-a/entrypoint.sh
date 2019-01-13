#!/bin/sh -l
set -e

if [ -n "$SNYK_TOKEN" ]; then
  sh -C "npm i -g snyk"
  sh -c "snyk test $*"
fi

