## Install Opentofu
FROM alpine:3.20 AS tofu
ADD install-opentofu.sh /install-opentofu.sh
RUN chmod +x /install-opentofu.sh
RUN apk add gpg gpg-agent
RUN ./install-opentofu.sh --install-method standalone
#Own build stage for image
FROM ubuntu:20.04 AS base
COPY --from=tofu /usr/local/bin/tofu /usr/local/bin/tofu
## Install Ansible
ENV ANSIBLE_VERSION=2.9.17
#Install needed software in docker image
RUN apt-get update && apt-get install -y \
    gcc python3 \
    python3-pip \
    python3 \
    python3-venv \
    curl \
    nano \
    git
#Clean apt packages and caches
RUN apt clean all
#Install pip
RUN pip3 install --upgrade pip; \
    pip3 install "ansible==${ANSIBLE_VERSION}"; \
    pip3 install ansible
## Create workdir
RUN mkdir /home/srv/
## Clone devops repository
RUN cd /home/srv/ && git clone https://github.com/gregoryca/devops.git
## Set DevOps as workdir
WORKDIR /home/srv/devops/
## enter container by ising the following command:
## docker run -it ansible
ENTRYPOINT [ "/bin/sh" ]