#!/bin/bash
cd /home
sudo systemctl enable nginx
sudo systemctl start nginx
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --list-all
sudo firewall-cmd --reload
