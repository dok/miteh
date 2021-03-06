#!/bin/bash
DIR=/Users/seandokko/workspace/data/snapshots
arg=$1
commandArg=$2
SNAPSHOT_DIR=/Users/seandokko/workspace/data/snapshots

CONFIG_FILE=/usr/local/etc/mongod.conf

if [ $1 == 'original' ]; then
    SNAPSHOT_DIR=/Users/seandokko/workspace/data/original
elif [ $1 == 'latest' ]; then
    var0="$(ls -t $DIR | sort | tail -1)"
    SNAPSHOT_DIR=$DIR/$var0
elif [ $1 == 'local' ]; then
    SNAPSHOT_DIR=/data/db
else
    SNAPSHOT_DIR=$DIR/$1
fi

# sed -i -e 's/^\(dbpath\s*=\s*\).*\$/\1$SNAPSHOT_DIR/' $CONFIG_FILE

if [ -d "$SNAPSHOT_DIR" ]; then
    echo "using ${SNAPSHOT_DIR}"
    mongo admin --eval 'db.shutdownServer()'
    echo mongod --fork --dbpath $SNAPSHOT_DIR --config $CONFIG_FILE
    mongod --fork --dbpath $SNAPSHOT_DIR --config $CONFIG_FILE
fi
