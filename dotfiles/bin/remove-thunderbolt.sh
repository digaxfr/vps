#!/bin/bash
# https://superuser.com/questions/1046928/thunderbolt-hotplugging-in-ubuntu-linux

# lspci -vt
echo "1" | sudo tee /sys/bus/pci/devices/0000\:00\:1c.0/remove
