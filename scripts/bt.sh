#!/bin/bash

# Obtener la lista de dispositivos conectados
connected_devices=$(bluetoothctl devices Connected | sed 's/Device //')

# Mostrar los dispositivos
echo "$connected_devices"
