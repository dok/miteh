#!/bin/bash
DIR=/usr/local/var/mongodb

prefix=brandclone
suffix=$(date +%s)  # The "+%s" option to 'date' is GNU-specific.
SNAPSHOT=$prefix.$suffix

SNAPSHOT_DIR=$DIR/snapshots/$SNAPSHOT

if [ ! -d "$DIR/snapshots" ]; then
    mkdir "$DIR/snapshots"
fi

mkdir $SNAPSHOT_DIR

echo $SNAPSHOT_DIR

cp $DIR/brandcast.* $DIR/snapshots/$SNAPSHOT

# cp /usr/local/var/mongodb/brandcast.* /usr/local