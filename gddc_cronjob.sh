#!/bin/bash

# Define ASCII_SCRIPT variable
ASCII_SCRIPT="/.bin/projects/load_gddc.sh"

# Create cronjob to run every 5 minutes
(crontab -l 2>/dev/null; echo "*/5 * * * * $ASCII_SCRIPT") | crontab -

# Check current crontab entries
echo "Current crontab entries:"
crontab -l 
