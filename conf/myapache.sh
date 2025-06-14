#!/bin/bash
sudo apt update -y
sudo apt install -y apache2
sudo systemctl enable apache2
sudo systemctl start apache2
echo "Apache installed and started successfully."
# Check if Apache is running
if systemctl is-active --quiet apache2; then
    echo "Apache is running."
else
    echo "Apache is not running."
fi
# Check if Apache is enabled to start on boot
if systemctl is-enabled --quiet apache2; then
    echo "Apache is enabled to start on boot."
else
    echo "Apache is not enabled to start on boot."
fi