#!/bin/bash

echo "====System Alerts ===="

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 -$8}')
MEM=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')
DISK=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

echo "CPU Usage : ${CPU}%"
if (( ${CPU%.*} > 80 )); then
    echo "WARNING: High CPU Usage!"
else
    echo "CPU Status : NORMAL"
fi

echo
echo "Memory Usage :${MEM}%"
if [ "$MEM" -gt 80 ]; then
    echo "WARNING: High Memory Usage!"
else
    echo "Memory Status : NORMAL"
fi

echo
echo "Disk Usage : ${DISK}%"
if [ "$DISK" -gt 80 ]; then
    echo "WARNING: High Disk Usage!"
else
    echo "Disk Status : NORMAL"
fi
