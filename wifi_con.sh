#!/bin/bash

# Define the name of the Wi-Fi network to connect to
WIFI_SSID="Your_WiFi_Network_Name"

# Check if the Wi-Fi network is already connected
connected_wifi=$(networksetup -getairportnetwork en0 | awk '{print $4}')
if [ "$connected_wifi" == "$WIFI_SSID" ]; then
    echo "Already connected to $WIFI_SSID."
    exit 0
fi

# Connect to the specified Wi-Fi network
echo "Connecting to $WIFI_SSID..."
networksetup -setairportnetwork en0 "$WIFI_SSID"

# Check if connection was successful
connected_wifi=$(networksetup -getairportnetwork en0 | awk '{print $4}')
if [ "$connected_wifi" == "$WIFI_SSID" ]; then
    echo "Successfully connected to $WIFI_SSID."
else
    echo "Failed to connect to $WIFI_SSID."
fi
