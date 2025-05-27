#!/bin/bash

# Update system packages
apt-get update
apt-get upgrade -y

# Install required packages
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io

# Start and enable Docker
systemctl start docker
systemctl enable docker

# Create application directory
mkdir -p /app
cd /app

# Create a simple health check endpoint
cat > /app/health.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Health Check</title>
</head>
<body>
    <h1>Service is healthy</h1>
</body>
</html>
EOF

# Install a simple HTTP server
apt-get install -y python3-pip
pip3 install http.server

# Start the HTTP server
nohup python3 -m http.server 80 > /var/log/http-server.log 2>&1 & 