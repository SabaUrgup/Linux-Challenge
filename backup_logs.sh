#!/bin/bash

# Backup Logs
backup_dir="/backup/logs"
if [ ! -d "$backup_dir" ]; then
  mkdir -p "$backup_dir"
fi

find /var/log -name "*.log" -exec cp {} "$backup_dir" \;
