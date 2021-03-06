#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
VERSION=$(cat $ROOT_DIR/package.json | jq -r '.version')

VERSION_REPLACE="s/@VERSION/$VERSION/"
GLOBAL_REPLACE="s/@GLOBAL/Treasure/"

cat $ROOT_DIR/src/loader.js |
  sed $GLOBAL_REPLACE |
  sed $VERSION_REPLACE |
  $ROOT_DIR/node_modules/.bin/uglifyjs -m -c > $ROOT_DIR/dist/loader.min.js
