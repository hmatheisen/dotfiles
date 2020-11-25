#!/bin/bash
# baraction.sh for spectrwm status bar

## DISK
hdd() {
    hdd="$(df -h | awk 'NR==4{print $3, $5}')"
    echo -e "HDD: $hdd"
}

## RAM
mem() {
    mem=`free | awk '/Mem/ {printf "%dM/%dM\n", $3 / 1024.0, $2 / 1024.0 }'`
    echo -e "MEM: $mem"
}

## CPU
cpu() {
    read cpu a b c previdle rest < /proc/stat
    prevtotal=$((a+b+c+previdle))
    sleep 0.5
    read cpu a b c idle rest < /proc/stat
    total=$((a+b+c+idle))
    cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
    echo -e "CPU: $cpu%"
}

pwr() {
    statusFile="/sys/class/power_supply/BAT0/status"
    capacityFile="/sys/class/power_supply/BAT0/capacity"
    [ -f $statusFile ] && status=$(cat $statusFile)
    [ -f $capacityFile ] && capacity=$(cat $capacityFile)

    bat="$capacity% ($status)"

    echo -e "BAT: $bat"
}

SLEEP_SEC=1 # loops forever outputting a line every SLEEP_SEC secs
while :; do
    echo "$(cpu)  $(mem)  $(pwr)  $(hdd)"
    sleep $SLEEP_SEC
done
