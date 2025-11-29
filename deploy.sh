#!/bin/bash
echo "Deploying website..."
DEPLOY_DIR="/tmp/cicd-website"
mkdir -p "$DEPLOY_DIR"
cp -r public/* "$DEPLOY_DIR/"
pkill -f "python3 -m http.server 8080" 2>/dev/null
sleep 1
cd "$DEPLOY_DIR"
nohup python3 -m http.server 8080 > /tmp/webserver.log 2>&1 &
echo "Deployment complete! Visit http://localhost:8080"
