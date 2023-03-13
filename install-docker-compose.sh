on of Docker Compose to install
VERSION="1.29.2"

# Download the Docker Compose binary
sudo curl -L "https://github.com/docker/compose/releases/download/$VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable permissions to the Docker Compose binary
sudo chmod +x /usr/local/bin/docker-compose

# Verify that the installation was successful
docker-compose --version

