#!/bin/bash

# Create directories for the wall command to move it somewhere hidden
# Usage: run with sudo privileges

# Make new directories for script to be placed
mkdir -p /.bin/projects

# Path to both scripts
CRONJOB_SCRIPT="./gddc_cronjob.sh"
ASCII_SCRIPT="/.bin/projects/load_gddc.sh"

# Move the mc_server file to the new directory
mv ./load_gddc.sh "$ASCII_SCRIPT"

# Make the ASCII art script executable
chmod +x "$ASCII_SCRIPT"
chmod +x "$CRONJOB_SCRIPT"
