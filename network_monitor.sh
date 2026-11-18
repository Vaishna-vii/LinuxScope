#!/bin/bash

echo "==== Network Monitor ===="
echo "IP Address: $(hostname -I)"
echo "Interface: $(ip route | grep default | cut -d ' ' -f5)"
