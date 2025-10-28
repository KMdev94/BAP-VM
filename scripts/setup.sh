#!/bin/bash

# Update package list and install necessary packages
sudo apt update
sudo apt install -y nginx gunicorn

# Enable and start Nginx and Gunicorn services
sudo systemctl enable nginx
sudo systemctl start nginx

sudo systemctl enable gunicorn
sudo systemctl start gunicorn

# Copy Nginx configuration
sudo cp nginx/sites-available/app.conf /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/

# Copy Gunicorn service configuration
sudo cp gunicorn/gunicorn.service /etc/systemd/system/
sudo systemctl daemon-reload

# Restart services to apply changes
sudo systemctl restart nginx
sudo systemctl restart gunicorn

echo "Setup completed successfully."