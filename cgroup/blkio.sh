#!/bin/bash -x
CGROUP="/sys/fs/cgroup/blkio/test"
dd if=/dev/zero of=testfile bs=4K count=1024 oflag=direct
mkdir -p $CGROUP
echo $$ > $CGROUP/tasks
echo "8:0 1048576" > $CGROUP/blkio.throttle.write_bps_device
cat $CGROUP/blkio.throttle.write_bps_device
dd if=/dev/zero of=testfile bs=4K count=1024 oflag=direct
