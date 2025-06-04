#!/bin/bash

# ANSI color codes
Color_Off='\033[0m'       # Text Reset
BPurple='\033[1;35m'      # Bold Purple
On_Green='\033[42m'       # Green Background

# File to store start time
STIME_FILE="Stime.txt"

# Function to convert time to minutes
to_minutes() {
    local hours=$1
    local minutes=$2
    echo $((hours * 60 + minutes))
}

# Function to display usage
usage() {
    echo "Usage: $0 [-s | -e]"
    echo "  -s : Record start time"
    echo "  -e : Calculate and display elapsed time since start"
    exit 1
}

# Check if an argument is provided
if [ $# -ne 1 ]; then
    usage
fi

case "$1" in
    -s)
        # Record start time
        Shour=$(date +%H)
        Smin=$(date +%M)
        Stime=$(to_minutes "$Shour" "$Smin")
        echo "$Stime" > "$STIME_FILE"
        echo -e "${BPurple}Start time recorded:${Color_Off} ${Shour}:${Smin} (${Stime} minutes)"
        ;;
    -e)
        # Check if start time file exists
        if [ ! -f "$STIME_FILE" ]; then
            echo -e "${BPurple}Error:${Color_Off} Start time not found. Run with -s first."
            exit 1
        fi

        # Read start time
        Stime=$(cat "$STIME_FILE")
        Ehour=$(date +%H)
        Emin=$(date +%M)
        Etime=$(to_minutes "$Ehour" "$Emin")

        # Display times
        echo -e "${BPurple}Start Time:${Color_Off} $((Stime / 60)):$((Stime % 60)) (${Stime} minutes)"
        echo -e "${BPurple}End Time:${Color_Off} ${Ehour}:${Emin} (${Etime} minutes)"

        # Calculate and display elapsed time
        time=$((Etime - Stime))
        if [ $time -lt 0 ]; then
            time=$((time + 1440)) # Handle cases where end time is on the next day
        fi
        echo -e "\n${On_Green}Elapsed Time: $time minutes${Color_Off}"
        ;;
    *)
        usage
        ;;
esac
