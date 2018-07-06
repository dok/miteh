#!/bin/bash
prefix=clone
suffix=$(date +%s)  # The "+%s" option to 'date' is GNU-specific.
SNAPSHOT=$prefix.$suffix


platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='mac'
fi

DIR=/usr/local/var/mongodb
SNAPSHOT_DIR=/data/snapshots/

NEW_SNAPSHOT_DIR=$SNAPSHOT_DIR$SNAPSHOT



# if original
CLONEDIR=$DIR
if [ $1 == 'original' ]; then
    CLONEDIR=/data/original
else
    CLONEDIR=$SNAPSHOT_DIR/$1
fi

if [ ! -d "$CLONEDIR" ]; then
    mkdir $CLONEDIR
fi

if [ "$(ls -A $CLONEDIR)" ]; then
    echo "$CLONEDIR found"
else
    echo "create a backup under $($CLONEDIR) by using:"
    # In versions of mongo 3.0+ we have to specify the db
    echo "mongorestore --host=127.0.0.1 -d clone path/to/dump && cp clone.* ./original"
    exit;
fi


# use original copy

mkdir $NEW_SNAPSHOT_DIR

echo $NEW_SNAPSHOT_DIR

cp -R $CLONEDIR/* $SNAPSHOT_DIR/$SNAPSHOT

# cp /data/clone.* /data//local
