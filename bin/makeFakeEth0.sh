#!/bin/sh
# See http://www.mathworks.com/matlabcentral/answers/73938-activating-on-linux-without-eth0
modprobe dummy
ip l set dev dummy0 name eth0
ip link set dev eth0 address 08:9e:01:bf:ad:88
