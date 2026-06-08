FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    cmake \
    libuv1-dev \
    libssl-dev \
    libhwloc-dev \
    ca-certificates

RUN git clone --depth 1 --branch v6.26.0 https://github.com/xmrig/xmrig.git

WORKDIR /xmrig/build

RUN cmake .. && make -j$(nproc)

RUN cp xmrig /usr/local/bin/xmrig

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
