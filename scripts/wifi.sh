#!/bin/bash

IFACE=$1
ESSID=$2

ip link set $IFACE up
iwconfig wlan0 essid $ESSID
dhcpcd -n $IFACE
