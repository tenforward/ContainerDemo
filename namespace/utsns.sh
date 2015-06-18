#!/bin/bash
# Demo script for uts namespace
hostname # display hostname on host
unshare --uts -- sh -c "hostname hogehoge ; hostname" # create a new utsns and set/display hostname 
hostname # display hostname on host
