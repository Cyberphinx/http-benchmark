#!/bin/bash
# Simple rate limit test
echo "Testing rate limits..."
echo "Normal requests (should work):"
for i in {1..5}; do
    echo -n "Request $i: "
    curl -s -o /dev/null -w "%{http_code}" http://localhost/
    echo
    sleep 1
done

echo -e "\nRapid requests (should get rate limited):"
for i in {1..15}; do
    echo -n "Request $i: "
    curl -s -o /dev/null -w "%{http_code}" http://localhost/
    echo
done

echo -e "\nCheck Nginx error log for rate limiting messages:"
tail -10 /var/log/nginx/error.log | grep limiting
