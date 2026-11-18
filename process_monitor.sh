#!/bin/bash

echo "=====Process Monitor====="
echo "Top CPU Processes:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -6

echo
echo "Top Memory Processes:"
ps -eo pid,comm,%mem --sort=-%mem | head -6
