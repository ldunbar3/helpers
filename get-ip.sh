#!/bin/bash
# Script: get-ip.sh
# Purpose: Displays the LAN and WAN IP Addresses. Primarily used on
# OLED display running on a Raspberry PI GPIO headless install.  
# Author: Lawrence Dunbar
# -------------------------------------------------------
#

PUBLIC=$(curl -s https://icanhazip.com/)
PRIVATE=$(hostname -I | cut -d " " -f1)

echo "LAN IP: $PRIVATE"
echo "WAN IP: $PUBLIC"
