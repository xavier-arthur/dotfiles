#!/bin/sh

IFS=','

ips="192.168.15.1,
192.168.15.2,
192.168.15.5,
192.168.0.1"

echo "$ips" | while read -r ip
do
    ping -c 3 "$ip" #>> /tmp/ipcheck
done

#grep -i 'ping statistics' /tmp/ipcheck
