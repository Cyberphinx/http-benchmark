FROM alpine:latest

# Install all required dependencies
RUN apk add --no-cache \
    build-base \
    git \
    openssl-dev \
    linux-headers \
    perl \
    make \
    zlib-dev

# Clone and build wrk in a single RUN command with proper error checking
RUN set -ex && \
    git clone --depth 1 https://github.com/wg/wrk.git /tmp/wrk && \
    cd /tmp/wrk && \
    make && \
    cp wrk /usr/local/bin/ && \
    rm -rf /tmp/wrk

# Set the entrypoint
ENTRYPOINT ["wrk"]
