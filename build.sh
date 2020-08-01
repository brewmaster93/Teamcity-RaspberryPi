cd context
wget -c https://download.jetbrains.com/teamcity/TeamCity-2020.1.tar.gz
tar zxfv TeamCity-*.tar.gz
sudo docker build . -f ../teamcity-server/Dockerfile -t teamcity-server:latest
sudo docker build . -f ../teamcity-minimal-agent/Dockerfile -t teamcity-minimal-agent:latest
sudo docker build . -f ../teamcity-agent/Dockerfile -t teamcity-agent:latest
sudo docker build . -f ../teamcity-agent-docker/Dockerfile -t teamcity-agent-docker:latest