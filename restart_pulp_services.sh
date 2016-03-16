#!/bin/bash
sudo systemctl stop pulp_celerybeat.service pulp_resource_manager.service pulp_workers.service
echo "stopped pulp services"
sudo systemctl start pulp_celerybeat.service pulp_resource_manager.service pulp_workers.service
echo "started pulp services"
sudo systemctl status pulp_celerybeat.service pulp_resource_manager.service pulp_workers.service

