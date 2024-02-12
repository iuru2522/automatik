#!/bin/bash

# Define log file path
LOG_FILE="/var/log/syslog"

# Define events to search for
EVENTS=("error" "warning" "failed" "critical")

# Function to search for events in log file and count occurrences
count_events() {
    for event in "${EVENTS[@]}"; do
        count=$(grep -c "$event" "$LOG_FILE")
        echo "Occurrences of '$event': $count"
    done
}

# Main function to generate report
generate_report() {
    echo "Log file analysis report:"
    echo "--------------------------"
    count_events
}

# Execute main function
generate_report
