#!/bin/bash

# Define output file
REPORT_FILE="system_report_$(date +'%Y-%m-%d_%H-%M-%S').txt"

# Get System Information
echo "System Report - $(date)" > $REPORT_FILE
echo "===================================" >> $REPORT_FILE

# CPU Usage
echo "CPU Usage:" >> $REPORT_FILE
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Load: " $2 "% user, " $4 "% system, " $8 "% idle"}' >> $REPORT_FILE
echo "" >> $REPORT_FILE

# Memory Usage
echo "Memory Usage:" >> $REPORT_FILE
free -h >> $REPORT_FILE
echo "" >> $REPORT_FILE

# Disk Usage
echo "Disk Usage:" >> $REPORT_FILE
df -h >> $REPORT_FILE
echo "" >> $REPORT_FILE

# Top 5 Memory-Consuming Processes
echo "Top 5 Memory-Consuming Processes:" >> $REPORT_FILE
ps aux --sort=-%mem | awk 'NR<=6 {print $0}' >> $REPORT_FILE
echo "" >> $REPORT_FILE

# Top 5 CPU-Consuming Processes
echo "Top 5 CPU-Consuming Processes:" >> $REPORT_FILE
ps aux --sort=-%cpu | awk 'NR<=6 {print $0}' >> $REPORT_FILE
echo "" >> $REPORT_FILE

# Print completion message
echo "System report generated: $REPORT_FILE"

