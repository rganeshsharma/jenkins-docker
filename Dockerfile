FROM ubuntu:18.04
USER root

RUN apt-get update && \
    apt-get install jenkins && \
    apt-get install && \
    ca-certificates && \
    curl && \
    gnupg && \
    lsb-release && \
    mkdir -p /etc/apt/keyrings && \
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
 echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
  apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin && \
 groupadd -g 999 docker && \
 usermod -aG staff,docker,daemon jenkins

USER jenkins
