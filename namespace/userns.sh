#!/bin/bash -x
unshare --user --uts -- sh -c "id && hostname test"
read
unshare --user --map-root-user --uts -- sh -c "id && hostname test && hostname && read"
