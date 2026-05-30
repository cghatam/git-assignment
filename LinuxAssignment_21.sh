#!/bin/bash

# Define log file path
LOG_FILE="/var/log/sys_report.log"

echo "==========================================" >> $LOG_FILE
echo "System Performance Report: $(date)" >> $LOG_FILE
echo "==========================================" >> $LOG_FILE

echo -e "\n--- 1. DISK USAGE ---" >> $LOG_FILE
df -h / >> $LOG_FILE

echo -e "\n--- 2. MEMORY USAGE ---" >> $LOG_FILE
free -h >> $LOG_FILE

echo -e "\n--- 3. TOP 5 CPU CONSUMING PROCESSES ---" >> $LOG_FILE
ps -eo pid,cmd,%cpu --sort=-%cpu | head -n 6 >> $LOG_FILE

echo -e "\n--- 4. TOP 5 MEMORY CONSUMING PROCESSES ---" >> $LOG_FILE
ps -eo pid,cmd,%mem --sort=-%mem | head -n 6 >> $LOG_FILE

echo -e "\n\n" >> $LOG_FILE