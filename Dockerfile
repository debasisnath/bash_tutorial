# Use official Ubuntu as base image
FROM ubuntu:latest

# Prevent interactive prompts during package installs
ENV DEBIAN_FRONTEND=noninteractive

# Install packages
RUN apt update && \
    apt install -y vim vim-tiny nano rsync grep curl git less man tree htop net-tools iputils-ping procps && \
    apt clean && rm -rf /var/lib/apt/lists/*
