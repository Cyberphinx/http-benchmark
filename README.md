# 1. Wrk

### It runs inside a docker container

```
docker build -t wrk-bench:latest .
docker run --rm wrk-bench:latest -t2 -c10 -d5s https://example.com
```

# 2. Curl

### A simple loop to curl the site:

```
chmod +x test_rate_limiting.sh

./test_rate_limiting.sh https://example.com
```
