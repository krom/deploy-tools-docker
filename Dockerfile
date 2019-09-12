FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y openssh-client rsync curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists
