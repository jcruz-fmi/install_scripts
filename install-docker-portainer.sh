ckage list
sudo apt-get update

# Install Docker
sudo apt-get install -y docker.io

# Start Docker service
sudo systemctl start docker

# Enable Docker service to start on boot
sudo systemctl enable docker

# Install Portainer
sudo docker volume create portainer_data
sudo docker run -d -p 9000:9000 \
	    --name portainer \
	        --restart always \
		    -v /var/run/docker.sock:/var/run/docker.sock \
		        -v portainer_data:/data \
			    portainer/portainer-ce

# Output confirmation message
echo "Docker and Portainer have been installed successfully."
