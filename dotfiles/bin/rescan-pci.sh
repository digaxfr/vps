#!/bin/bash
# https://superuser.com/questions/1046928/thunderbolt-hotplugging-in-ubuntu-linux

echo "1" | sudo tee /sys/bus/pci/rescan
