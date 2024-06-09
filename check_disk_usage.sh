#!/bin/bash

# Check Disk Usage
disk_usage=$(df /home | awk 'NR==2 {print $5}' | sed 's/%//')
if [ $disk_usage -gt 80 ]; then
  echo "Warning: /home disk usage is in critical level at ${disk_usage}%"
fi
