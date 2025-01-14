#!/bin/bash

# Email recipient
RECIPIENT="ranjanshruti186@gmail.com"

# Get current date
DATE=$(date "+%Y-%m-%d %H:%M:%S")

# Log file
LOG_FILE="/tmp/server_report.log"

# Start logging
echo "📅 Server Monitoring Report - $DATE" > $LOG_FILE
echo "======================================" >> $LOG_FILE

# CPU Usage
echo "🔹 CPU Usage:" >> $LOG_FILE
mpstat | tail -1 >> $LOG_FILE
echo "" >> $LOG_FILE

# Memory Usage
echo "🔹 Memory Usage:" >> $LOG_FILE
free -h >> $LOG_FILE
echo "" >> $LOG_FILE

# Disk Usage
echo "🔹 Disk Usage:" >> $LOG_FILE
df -h / >> $LOG_FILE
echo "" >> $LOG_FILE

# Open Ports & Running Services
echo "🔹 Open Ports & Running Services:" >> $LOG_FILE
netstat -tulnp >> $LOG_FILE
echo "" >> $LOG_FILE

# Logged-in Users
echo "🔹 Logged-in Users:" >> $LOG_FILE
who >> $LOG_FILE
echo "" >> $LOG_FILE

# Users with sudo access
echo "🔹 Users with Sudo Access:" >> $LOG_FILE
getent group sudo | cut -d: -f4 >> $LOG_FILE
echo "" >> $LOG_FILE

# Send email
mail -s "Daily Server Monitoring Report - $DATE" "$RECIPIENT" < $LOG_FILE

