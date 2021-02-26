#!/usr/bin/env bash

# type: 
# $ xinput list 
# and look for touchpad id (usually 12)
id=12

TOUCH_ENABLED=`xinput list-props $id | grep Device\ Enabled | awk '{ print $4 }'`
if [ $TOUCH_ENABLED = 0 ]; then
        xinput set-prop $id "Device Enabled" 1
elif [ $TOUCH_ENABLED = 1 ]; then
        xinput set-prop $id "Device Enabled" 0
else
        i3-nagbar -t error -m 'Could not get touchpad status from xinput.' 'i3-msg exit'
        exit 1
fi
exit 0
