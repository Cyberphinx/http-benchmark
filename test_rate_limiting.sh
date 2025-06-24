#! /bin/bash

site=$1

# Run this in a loop to trigger rate limiting
for i in {1..20}; do
    curl -I "$1"
    echo "Request $i completed"
    sleep 0.5 # Half-second delay between requests
done
