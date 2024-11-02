# Update system packages
sudo yum update -y

# Install Git, OpenJDK 8, and Maven
sudo yum install -y git java-1.8.0-openjdk maven

# Add Jenkins repository
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Update all packages (including new repo packages)
sudo yum upgrade -y

# Add Amazon Corretto 17 repository
sudo curl -L -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo

# Install Amazon Corretto 17
sudo yum install -y java-17-amazon-corretto

# Set the default Java version to Amazon Corretto 17
sudo alternatives --config java

# Install Jenkins
sudo yum install -y jenkins

# Enable and start Jenkins service
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Check Jenkins service status
sudo systemctl status jenkins
