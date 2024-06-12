FROM jenkins/jenkins:2.414.2-jdk11

USER root

# Install required packages
RUN apt-get update && apt-get install -y lsb-release python3-pip

# Add Docker's official GPG key
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc https://download.docker.com/linux/debian/gpg

# Set up the stable repository
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.asc] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# Install Docker CLI
RUN apt-get update && apt-get install -y docker-ce-cli

USER jenkins

# Install Jenkins plugins
RUN jenkins-plugin-cli --plugins "blueocean:1.25.3 docker-workflow:1.28"

# Keep the container running
CMD ["tail", "-f", "/dev/null"]
