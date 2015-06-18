#!/bin/bash
# Demo script for network namespace
NETNS="netns01"
VETH="veth0"
ip a
ip netns add $NETNS
ip netns list
ip netns exec $NETNS ip link show
ip netns exec $NETNS ip route
ip netns exec $NETNS iptables -L -n -v
ip link add name $VETH-host type veth peer name $VETH-ns
ip link set $VETH-ns netns $NETNS
ip link show | grep $VETH # on host
ip netns exec $NETNS ip link show # in netns
ip addr add 10.10.10.10/24 dev $VETH-host
ip link set $VETH-host up
ip netns exec $NETNS ip addr add 10.10.10.11/24 dev $VETH-ns
ip netns exec $NETNS ip link set $VETH-ns up
ip netns exec $NETNS ip addr show | grep veth
ping -c 1 10.10.10.11
ip netns exec $NETNS ping -c 1 10.10.10.10
ip link delete $VETH-host
ip netns delete $NETNS
