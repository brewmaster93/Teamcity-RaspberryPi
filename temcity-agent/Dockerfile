FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    maven \
    gradle \
	nodejs
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

RUN add-apt-repository \
   "deb [arch=arm64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
RUN apt-get update
RUN apt-get install -y docker-ce docker-ce-cli containerd.io

RUN curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

ENV SERVER_URL="172.17.0.1"


COPY dist /opt/buildagent/

VOLUME /opt/buildagent/conf

VOLUME /opt/buildagent/logs

CMD /bin/bash /opt/buildagent/bin/install.sh

CMD /bin/bash /opt/buildagent/bin/agent.sh start && tail -f /dev/null
