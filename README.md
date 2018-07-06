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

### Usage

legend: [required]{command} [optional]{name}

./miteh use {latest|original}

./miteh copy

./miteh clean
