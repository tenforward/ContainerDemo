#!/bin/bash
# Demo script for mount namespace
unshare --mount -- bash -c "mount -o bind /usr /mnt && echo $BASHPID && echo 'ls -F' && ls -F /mnt && read INPUT"
