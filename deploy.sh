#!/bin/bash
echo "Deploying website..."

DEPLOY_DIR="/tmp/cicd-website"
mkdir -p "$DEPLOY_DIR"
cp -r public/* "$DEPLOY_DIR/"

echo "Stopping old server..."
pkill -f "python3 -m http.server 8080" 2>/dev/null
sleep 2

echo "Starting web server..."
cd "$DEPLOY_DIR"
python3 -m http.server 8080 </dev/null >/tmp/webserver.log 2>&1 &
disown

sleep 2

if lsof -i :8080 >/dev/null 2>&1; then
    echo "SUCCESS! Server running on http://localhost:8080"
else
    echo "ERROR: Server failed to start"
    exit 1
fi
