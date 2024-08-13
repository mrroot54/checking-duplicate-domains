#!/bin/bash

# Function to print messages in red
print_red() {
    echo -e "\033[31m$1\033[0m"
}

# Function to print messages in green
print_green() {
    echo -e "\033[32m$1\033[0m"
}

# Check if a file was provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <file_with_domains>"
    exit 1
fi

# Set the input file from the first argument
input_file="$1"

# Check if the file exists
if [ ! -f "$input_file" ]; then
    echo "File not found!"
    exit 1
fi

# Check for duplicate domains
duplicates=$(sort "$input_file" | uniq -d)

if [ -n "$duplicates" ]; then
    print_red "Duplicate domains found:"
    echo "$duplicates"
else
    print_green "No duplicate domains found."
fi
