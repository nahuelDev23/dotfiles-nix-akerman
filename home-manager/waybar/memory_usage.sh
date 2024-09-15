#!/bin/bash

# Obtén el uso total y disponible de memoria
total_mem=$(grep MemTotal /proc/meminfo | awk '{print $2}')
used_mem=$(grep MemAvailable /proc/meminfo | awk '{print $2}')
used_percent=$((100 - (used_mem * 100 / total_mem)))

echo "$used_percent"
