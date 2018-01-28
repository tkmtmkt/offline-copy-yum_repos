#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
BASE_DIR=$(dirname $SCRIPT_DIR)
BASE_NAME=$(basename $SCRIPT_DIR)

tar czf $BASE_NAME-$(date +%Y%m%d).tar.gz -C $BASE_DIR \
    --exclude=$BASE_NAME/$BASE_NAME-*.tar.gz \
    $BASE_NAME
