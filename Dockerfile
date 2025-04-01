FROM ubuntu:20.04
## Install Ansible
ENV ANSIBLE_VERSION=2.9.17
RUN apt-get update && apt-get upgrade && \
    apt-get install -y gcc python3 && \
    apt-get install -y python3-pip && \
    apt-get install curl && \
    apt-get install -y nano && \
    apt-get install -y git && \
    apt-get clean all
RUN pip3 install --upgrade pip; \
    pip3 install "ansible==${ANSIBLE_VERSION}"; \
    pip3 install ansible

## Install Opentofu
FROM alpine:3.20 AS tofu

ADD install-opentofu.sh /install-opentofu.sh
RUN chmod +x /install-opentofu.sh
RUN apk add gpg gpg-agent
RUN ./install-opentofu.sh --install-method standalone

## Create workdir
RUN mkdir /home/srv/

## Set workdir
WORKDIR /home/srv/devops/

## Curl devops repository
RUN git clone https://github.com/gregoryca/devops.git

## enter container by ising the following command:
## docker run -it ansible