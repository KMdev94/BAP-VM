#!/bin/bash

# Restart Nginx service
sudo systemctl restart nginx

# Restart Gunicorn service
sudo systemctl restart gunicorn

echo "Nginx and Gunicorn services have been restarted."