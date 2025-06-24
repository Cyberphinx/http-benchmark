#! /bin/bash

site=$1

# Run this in a loop to trigger rate limiting
for i in {1..50}; do
    curl -I "$1"
    echo "Request $i completed"
    sleep 0.0001 # Half-second delay between requests
done
