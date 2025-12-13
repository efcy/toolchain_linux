FROM ubuntu:24.04

# Install system dependencies
RUN apt-get update -y --fix-missing \
    && apt-get --no-install-recommends install openjdk-8-jre build-essential \
    cmake zlib1g-dev git libreadline-dev gettext curl jq \
    clang llvm lld wget tree pigz xxd debootstrap unzip gpg rsync uuid-dev -y && rm -rf /var/lib/apt/lists/*

# Set the working directory to /naoth
WORKDIR /naoth/toolchain

# Copy the current directory contents into the container at /naoth
COPY . /naoth/toolchain

ENV NAOTH_TOOLCHAIN_PATH=/naoth/toolchain
ENV PATH="${PATH}:${NAOTH_TOOLCHAIN_PATH}/toolchain_native/extern/bin:${NAOTH_TOOLCHAIN_PATH}/toolchain_native/extern/lib"
ENV NAO_CTC="${NAOTH_TOOLCHAIN_PATH}/toolchain_nao_ubuntu/"
ENV EXTERN_PATH_NATIVE="${NAOTH_TOOLCHAIN_PATH}/toolchain_native/extern/"
ENV CC=clang
ENV CXX=clang++
ENV LD=ld.lld

# setup the toolchain libs
RUN yes Y | ./setup.sh && rm -rf toolchain_native/extern/extracted && rm -rf toolchain_native/extern/downloads
