#!/bin/bash
sudo systemctl stop pulp_celerybeat.service
sudo systemctl stop pulp_resource_manager.service
sudo systemctl stop pulp_workers.service
echo "stopped pulp services"
sudo systemctl start pulp_celerybeat.service
sudo systemctl start pulp_resource_manager.service
sudo systemctl start pulp_workers.service
echo "started pulp services"
sudo systemctl status pulp_celerybeat.service
sudo systemctl status pulp_resource_manager.service
sudo systemctl status pulp_workers.service

