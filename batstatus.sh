#!/bin/bash

BAT=/org/freedesktop/UPower/devices/battery_BAT0
STAT=$(upower -i ${BAT})
P=$(upower -i ${BAT} | grep percentage | sed 's/[^0-9]*//g')
echo -e ${P}
