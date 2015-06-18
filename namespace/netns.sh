#!/bin/bash -x
# Demo script for network namespace
NETNS="netns01"
VETH="veth0"
ip a
read
ip netns add $NETNS
read
ip netns list
read
ip netns exec $NETNS ip link show
read
ip netns exec $NETNS ip route
read
ip netns exec $NETNS iptables -L -n -v
read
ip link add name $VETH-host type veth peer name $VETH-ns
read
ip link set $VETH-ns netns $NETNS
read
ip link show | grep $VETH # on host
read
ip netns exec $NETNS ip link show # in netns
read
ip addr add 10.10.10.10/24 dev $VETH-host
read
ip link set $VETH-host up
read
ip netns exec $NETNS ip addr add 10.10.10.11/24 dev $VETH-ns
read
ip netns exec $NETNS ip link set $VETH-ns up
read
ip netns exec $NETNS ip addr show | grep veth
read
ping -c 1 10.10.10.11
read
ip netns exec $NETNS ping -c 1 10.10.10.10
read
ip link delete $VETH-host
read
ip netns delete $NETNS
read
