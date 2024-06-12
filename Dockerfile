FROM jenkins/inbound-agent:latest

# Switch to the root user
USER root

# Install Python3
RUN apt-get update && apt-get install -y python3 python3-pip

# Switch back to the jenkins user
USER jenkins

# Keep the container running
CMD ["tail", "-f", "/dev/null"]
