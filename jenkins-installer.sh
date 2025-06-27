#!/bin/bash

# Update system packages
sudo apt update && sudo apt upgrade -y

# Install Java (Jenkins dependency)
sudo apt install -y openjdk-17-jdk

# Add Jenkins repository and key
wget -O - https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package list again
sudo apt update

# Install Jenkins
sudo apt install -y jenkins

# Start and enable Jenkins service
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Open Jenkins port (8080) in firewall
sudo ufw allow 8080/tcp
sudo ufw reload

# Display Jenkins initial admin password
echo "Jenkins Installation Complete!"
echo "Use the following command to get the initial admin password:"
echo "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
