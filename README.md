# Linux-Challenge

This repository contains scripts to perform linux challenge tasks as part of a Vodafone DevOps Bootcamp.

## Tasks Overview

1. **Check Disk Usage**
    - The script checks the disk usage of the `/home` directory.
    - If the usage exceeds 80%, it prints a warning message.

2. **Backup Logs**
    - The script finds all `.log` files in the `/var/log` directory.
    - It copies these files to the `/backup/logs` directory, creating the directory if it does not exist.

3. **System Health Report**
    - The script generates a report including the current date and time, system uptime, and memory usage.
    - It saves the report to `/home/admin/system_health_$(date +%F).txt`.

## How to Use

1. **Check Disk Usage**

    Save the following script as `check_disk_usage.sh`:
    ```bash
    #!/bin/bash

    # Check Disk Usage
    disk_usage=$(df /home | awk 'NR==2 {print $5}' | sed 's/%//')
    if [ $disk_usage -gt 80 ]; then
      echo "Warning: /home disk usage is in critical level at ${disk_usage}%"
    fi
    ```

    Make it executable and run it:
    ```sh
    chmod +x check_disk_usage.sh
    ./check_disk_usage.sh
    ```

2. **Backup Logs**

    Save the following script as `backup_logs.sh`:
    ```bash
    #!/bin/bash

    # Backup Logs
    backup_dir="/backup/logs"
    if [ ! -d "$backup_dir" ]; then
      mkdir -p "$backup_dir"
    fi

    find /var/log -name "*.log" -exec cp {} "$backup_dir" \;
    ```

    Make it executable and run it:
    ```sh
    chmod +x backup_logs.sh
    ./backup_logs.sh
    ```

3. **System Health Report**

    Save the following script as `system_health_report.sh`:
    ```bash
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
    ```

    Make it executable and run it:
    ```sh
    chmod +x system_health_report.sh
    ./system_health_report.sh
    ```
