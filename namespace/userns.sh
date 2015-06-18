#!/bin/bash
unshare --user --uts -- hostname test
read
unshare --user --map-root-user --uts -- sh -c "hostname test && hostname"
