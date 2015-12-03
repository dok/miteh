#!/bin/bash
DIR=/usr/local/var/mongodb/snapshots
arg=$1
commandArg=$2
SNAPSHOT_DIR=$DIR/$1

CONFIG_FILE=/usr/local/etc/mongod.conf

if [ $1 == 'latest' ]; then
    var0="$(ls -t $DIR | sort | tail -1)"
    SNAPSHOT_DIR=$DIR/$var0
elif [ $1 == 'original' ]; then
    SNAPSHOT_DIR=$DIR/..
else
    SNAPSHOT_DIR=$DIR/$1
fi

# sed -i -e 's/^\(dbpath\s*=\s*\).*\$/\1$SNAPSHOT_DIR/' $CONFIG_FILE

if [ -d "$SNAPSHOT_DIR" ]; then
    echo "using ${SNAPSHOT_DIR}"
    mongo admin --eval 'db.shutdownServer()'
    mongod --fork --logpath /usr/local/var/log/mongodb/mongo.log --dbpath $SNAPSHOT_DIR
fi