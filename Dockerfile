FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    cmake \
    libuv1-dev \
    libssl-dev \
    libhwloc-dev

RUN git clone --depth 1 --branch v6.26.0 https://github.com/xmrig/xmrig.git

WORKDIR /xmrig/build

RUN cmake .. && make -j$(nproc)

ENTRYPOINT ["./xmrig"]
