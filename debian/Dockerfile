# syntax=docker/dockerfile:1

FROM debian:12-slim

RUN apt-get update && apt-get install -y \
    sudo \
    bash \
    nano \
    vim \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m user && echo "user:password" | chpasswd && adduser user sudo
USER user

WORKDIR /home/user
COPY . .
CMD ["/bin/bash"]