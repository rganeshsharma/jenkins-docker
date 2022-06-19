FROM ubuntu:18.04
USER root

RUN apt-get update && \
    
    apt-get install openjdk-8-jdk && \
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add && \
    sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list' && \
    apt-get install jenkins && \
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
