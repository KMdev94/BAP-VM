# GCP VM Configurations for Nginx and Gunicorn

This repository contains configurations and scripts for managing Nginx and Gunicorn services on a Google Cloud Platform (GCP) Virtual Machine (VM). 

## Project Structure

- **nginx/**: Contains Nginx configuration files.
  - **sites-available/**: Holds the server block configuration for the application.
  - **sites-enabled/**: Contains a `.gitkeep` file to track the directory in Git.
  - **nginx.conf**: The main configuration file for Nginx.

- **gunicorn/**: Contains Gunicorn service configuration files.
  - **gunicorn.service**: Defines the systemd service for Gunicorn.
  - **gunicorn.conf**: Configuration settings for Gunicorn.

- **scripts/**: Contains deployment and setup scripts.
  - **deploy.sh**: Automates the deployment process for Nginx and Gunicorn.
  - **setup.sh**: Sets up the environment and dependencies.
  - **restart-services.sh**: Restarts Nginx and Gunicorn services.

- **terraform/**: Contains Terraform configuration files for provisioning the GCP VM.
  - **main.tf**: Main Terraform configuration.
  - **variables.tf**: Defines variables for the Terraform configuration.
  - **outputs.tf**: Specifies outputs from the Terraform configuration.

- **ansible/**: Contains Ansible playbooks and inventory files for deployment automation.
  - **playbooks/**: Holds the deployment playbook.
    - **deploy.yml**: Automates the deployment process.
  - **inventory/**: Contains the inventory file for Ansible.
    - **hosts.ini**: Lists the GCP VMs managed by Ansible.

- **.gitignore**: Specifies files and directories to be ignored by Git.

## Setup Instructions

1. Clone the repository to your local machine.
2. Navigate to the project directory.
3. Run the `setup.sh` script to install necessary dependencies.
4. Use the `deploy.sh` script to apply the Nginx and Gunicorn configurations to your GCP VM.
5. If you make changes to the configuration files, run the `restart-services.sh` script to apply the changes.

## Usage Guidelines

- Ensure that your GCP VM is properly configured and accessible.
- Modify the configuration files as needed to suit your application requirements.
- Use the provided scripts to streamline the deployment and management of your services.

For further assistance, please refer to the individual configuration files and scripts for detailed comments and usage instructions.