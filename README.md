# local-mongo-snapshots
shell commands to snapshot local mongo images

### Getting Started

The tool needs a certain `/data/db/` structure for it to work
```
/data
+-- original
    +-- original contents
+-- snapshots
    +-- snapshot_[timestamp]
```

`/original` should contain your image

![Example of Structure](https://user-images.githubusercontent.com/1214868/42394934-bf662520-8110-11e8-9fb6-45da42723c33.png)



### Usage

![screen shot 2018-07-06 at 11 40 56 am](https://user-images.githubusercontent.com/1214868/42395116-81572e4a-8111-11e8-8de9-ac3944cb8911.png)


legend: [required]{command} [optional]{name}

./miteh use {latest|original}

./miteh copy {original|name_of_snapshot}

./miteh clean

I like to do `./miteh copy original && ./miteh use latest`, which will copy the original and use the latest created snapshot from the directory.

