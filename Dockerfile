## Install and setup OpenTofu
FROM ubuntu:20.04

ENV ANSIBLE_VERSION=2.9.17

## Setup and install ansible
RUN apt update; \
    apt install -y gcc python3; \
    apt install -y python3-pip; \
    apt install -y curl \
    apt clean all
RUN pip3 install --upgrade pip; \
    pip3 install "ansible==${ANSIBLE_VERSION}"; \
    pip3 install ansible

RUN curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh
# ADD install-opentofu.sh /install-opentofu.sh
RUN chmod +x /install-opentofu.sh
RUN apk add gpg gpg-agent
RUN ./install-opentofu.sh --install-method standalone --install-path / --symlink-path -