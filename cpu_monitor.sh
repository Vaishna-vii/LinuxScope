#!/bin/bash

echo "==== CPU Monitor====="
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
echo "CPU Usage: $CPU %"
echo "====================="
