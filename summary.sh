#!/bin/bash

clear
run_module() {
    if [ -f "$1" ]; then
        bash "$1"
    else
        echo "ERROR: $1 not found!"
    fi
}

echo "==============================================="
echo "        L I N U X S C O P E                  "
echo "==============================================="
echo "------SYSTEM INFORMATION------"
run_module "./system_info.sh"
echo "------CPU MONITOR------"
run_module "./cpu_monitor.sh"
echo "------MEMEORY MONITOR------"
run_module "./memory_monitor.sh"
echo "------DISK MONITOR------"
run_module "./disk_monitor.sh"
echo "------Network Monitor------"
run_module "./network_monitor.sh"
echo "------PROCESS MONITOR------"
run_module "./process_monitor.sh"
echo "------SYSTEM HEALTH------"
run_module "./health_monitor.sh"
echo "------SYSTEM ALERTS------"
run_module "./alert_monitor.sh"
echo "==============================================="
echo " LINUXSCOPE Complete"
echo "==============================================="
