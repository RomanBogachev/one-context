#!/bin/bash

MOUNT_DIR=/mnt
TMP_DIR=/tmp/one-context-tmp

if [ -z "$INIT_SCRIPTS" ]; then
    if [ -f "$MOUNT_DIR/init.sh" ]; then
        INIT_SCRIPTS=init.sh
    fi
fi

mkdir -p $TMP_DIR
cd $MOUNT_DIR

for f in $INIT_SCRIPTS; do
    cp $f $TMP_DIR
    chmod +x $TMP_DIR/$f
    $TMP_DIR/$f
done
