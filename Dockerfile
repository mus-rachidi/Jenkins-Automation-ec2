FROM jenkins/jenkins:latest

USER root

# Install necessary packages
RUN apt-get update && apt-get install -y sudo make apt-transport-https ca-certificates curl gnupg2 software-properties-common

# Install Docker CLI
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y docker-ce-cli

#install git 
RUN apt-get install -y git

