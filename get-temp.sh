#!/bin/bash
# Script: get-temp.sh
# Purpose: Display the current temperature of Raspberry Pi CPU and GPU 
# Author: Lawrence Dunbar
# -------------------------------------------------------
#
# Threshold Temperatures in Celsius
# 60 - CYAN
CYAN='\e[0;36m'
# 68 - Yellow
YELLOW='\e[0;33m'
# 75 - Light Red
LRED='\e[0;31m'
# >76 - Bright Red
BRED='\e[0;91m'
# Reset Color
NC='\e[0m'

# Get Temperatures of CPU & GPU
CPU_TEMP=$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))
GPU_TEMP=$(vcgencmd measure_temp | cut -d "=" -f 2 | cut -d "." -f1)

# Temperature converted to Fahrenheit
CPU_TEMP_F=$((CPU_TEMP * 9/5 +32))
GPU_TEMP_F=$((GPU_TEMP * 9/5 +32))

# CPU Temperature - Colorize output depending on temperature
if [ $CPU_TEMP -ge 76 ]; then
	echo -e "CPU Temp: ${BRED}$CPU_TEMP'C / $CPU_TEMP_F'F${NC}"
   elif [ $CPU_TEMP -ge 68 ]; then
	echo -e "CPU Temp: ${LRED}$CPU_TEMP'C / $CPU_TEMP_F'F${NC}"
   elif [ $CPU_TEMP -ge 60 ]; then
	echo -e "CPU Temp: ${YELLOW}$CPU_TEMP'C / $CPU_TEMP_F'F${NC}"
   else
	echo -e "CPU Temp: ${CYAN}$CPU_TEMP'C / $CPU_TEMP_F'F${NC}"
fi

# GPU Temperature - Colorize output depending on temperature

if [ $GPU_TEMP -ge 76 ]; then
        echo -e "GPU Temp: ${BRED}$GPU_TEMP'C / $GPU_TEMP_F'F${NC}"
   elif [ $GPU_TEMP -ge 68 ]; then
        echo -e "GPU Temp: ${LRED}$GPU_TEMP'C / $GPU_TEMP_F'F${NC}"
   elif [ $GPU_TEMP -ge 60 ]; then
        echo -e "GPU Temp: ${YELLOW}$GPU_TEMP'C / $GPU_TEMP_F'F${NC}"
   else
        echo -e "GPU Temp: ${CYAN}$GPU_TEMP'C / $GPU_TEMP_F'F${NC}"
fi
