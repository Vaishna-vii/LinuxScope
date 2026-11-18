#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

DATE=$(date +'%Y-%m-%d_%H-%M-%S')
LOGFILE="logs/sys_$DATE.log"

echo "===LINUXSCOPE log===" > "$LOGFILE"
echo "Date: $(date)" >> "$LOGFILE"

echo >> "$LOGFILE"
echo "======System Information======" >> "$LOGFILE"
./system_info.sh >> "$LOGFILE"

echo >> "$LOGFILE"
echo "======CPU Monitor======" >> "$LOGFILE"
./cpu_monitor.sh >> "$LOGFILE"

echo >> "$LOGFILE"
echo "======Memory Monitor======" >> "$LOGFILE"
./memory_monitor.sh >> "$LOGFILE"

echo >> "$LOGFILE"
echo "======Disk Monitor======" >> "$LOGFILE"
./disk_monitor.sh >> "$LOGFILE"

echo >> "$LOGFILE"
echo "======Network Monitor======" >> "$LOGFILE"
bash "$SCRIPT_DIR/network_monitor.sh" >> "$LOGFILE"

echo >> "$LOGFILE"
echo "======System Health======" >> "$LOGFILE"
bash "$SCRIPT_DIR/health_monitor.sh" >> "$LOGFILE"

echo >> "$LOGFILE"
echo "======Process Monitor======" >> "$LOGFILE"
bash "$SCRIPT_DIR/process_monitor.sh" >> "$LOGFILE"

echo >> "$LOGFILE"
echo "======System Alerts======" >> "$LOGFILE"
bash "$SCRIPT_DIR/alert_monitor.sh" >> "$LOGFILE"

echo "Log saved to: $LOGFILE"
