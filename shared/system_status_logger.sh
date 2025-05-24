#!/bin/bash

LOG_DIR="/mnt/shared"
LOG_FILE="$LOG_DIR/system_status.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Ensure the log directory exists
mkdir -p "$LOG_DIR"

# Capture outputs of system commands and format them for single-line output
# Replace newlines with spaces and ensure no pipe characters in the raw output
UPTIME_OUTPUT=$(uptime | tr '\n' ' ' | tr '|' '_')
MEMORY_OUTPUT=$(free -h | tr '\n' ' ' | tr '|' '_')
DISK_OUTPUT=$(df -h | tr '\n' ' ' | tr '|' '_')
TOP_OUTPUT=$(top -bn1 | head -n 20 | tr '\n' ' ' | tr '|' '_')

# Construct pipe-separated key-value string
# Each field is in 'key=value' format, separated by '|'
PIPE_OUTPUT="timestamp=\"$TIMESTAMP\"|uptime=\"$UPTIME_OUTPUT\"|memory_usage=\"$MEMORY_OUTPUT\"|disk_usage=\"$DISK_OUTPUT\"|top_processes=\"$TOP_OUTPUT\""

# Append the formatted output to log file
echo "$PIPE_OUTPUT" >> "$LOG_FILE"

