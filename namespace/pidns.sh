#!/bin/bash
# Demo script for pid namespace
unshare --pid --mount-proc --fork -- ls -F /proc
