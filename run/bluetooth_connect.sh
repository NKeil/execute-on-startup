#!/bin/sh

# connect to bluetooth device
bluetoothctl << EOF
    connect XX:XX:XX:XX:XX:XX
    exit
EOF
