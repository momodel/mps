FROM nvidia/cuda:10.1-base-ubuntu16.04

RUN apt-get update && apt-get install -y --no-install-recommends \
        cuda-samples-$CUDA_PKG_VERSION && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/cuda/samples/5_Simulations/nbody

RUN make -j"$(nproc)"

CMD ["./nbody", "-benchmark", "-i=10000"]
