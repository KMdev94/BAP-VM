#!/bin/bash

# Update package lists
sudo apt-get update

# Install Nginx
sudo apt-get install -y nginx

# Copy Nginx configuration
sudo cp nginx/sites-available/app.conf /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/

# Copy Nginx main configuration
sudo cp nginx/nginx.conf /etc/nginx/nginx.conf

# Install Gunicorn
sudo apt-get install -y gunicorn

# Copy Gunicorn service file
sudo cp gunicorn/gunicorn.service /etc/systemd/system/
sudo systemctl enable gunicorn
sudo systemctl start gunicorn

# Restart Nginx to apply changes
sudo systemctl restart nginx

# Print status of services
sudo systemctl status nginx
sudo systemctl status gunicorn