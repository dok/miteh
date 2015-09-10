#!/bin/bash
DIR=/usr/local/var/mongodb

prefix=brandclone
suffix=$(date +%s)  # The "+%s" option to 'date' is GNU-specific.
SNAPSHOT=$prefix.$suffix

SNAPSHOT_DIR=$DIR/snapshots/$SNAPSHOT

if [ ! -d "$DIR/snapshots" ]; then
    mkdir "$DIR/snapshots"
fi

# if original
CLONEDIR=$DIR
if [ $1 == 'original' ]; then
    CLONEDIR=$DIR/original
    if [ ! -d "$CLONEDIR" ]; then
        mkdir $CLONEDIR
    fi

    if [ "$(ls -A $CLONEDIR)" ]; then
        echo "$CLONEDIR found"
    else
        echo "create a backup under $($CLONEDIR) by using:"
        # In versions of mongo 3.0+ we have to specify the db
        echo "mongorestore --host=127.0.0.1 -d brandcast path/to/dump && cp brandcast.* ./original"
        exit;
    fi
fi

# use original copy

mkdir $SNAPSHOT_DIR

echo $SNAPSHOT_DIR

cp $CLONEDIR/brandcast.* $DIR/snapshots/$SNAPSHOT

# cp /usr/local/var/mongodb/brandcast.* /usr/local