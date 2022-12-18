#!/bin/bash

sudo rm /etc/systemd/system/dhclient-refresh.{service,timer}
sudo cp -f dhclient-refresh.service dhclient-refresh.timer /etc/systemd/system/
sudo systemctl stop dhclient-refresh.service
sudo systemctl daemon-reload
sudo systemctl enable dhclient-refresh.timer dhclient-refresh.service
sudo systemctl start dhclient-refresh.service
sudo systemctl daemon-reload
