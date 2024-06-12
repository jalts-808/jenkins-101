FROM jenkins/jenkins:lts-alpine

USER root

# Install Python3 and pip
RUN apk update && apk add --no-cache python3 py3-pip

# Switch back to the jenkins user
USER jenkins

# Set the command to keep the container running
CMD ["tail", "-f", "/dev/null"]
