#!/bin/bash

# System Health Report
report_file="/home/admin/system_health_$(date +%F).txt"
current_datetime=$(date '+%Y-%m-%d %H:%M:%S')
uptime_info=$(uptime -p)
memory_usage=$(free -h | awk '/^Mem/ {print $3 "/" $2}')

echo "Date and Time: $current_datetime" > $report_file
echo "System Uptime: $uptime_info" >> $report_file
echo "Memory Usage: $memory_usage" >> $report_file
echo "System health report saved to $report_file"
