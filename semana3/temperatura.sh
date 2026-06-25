#!/bin/bash

echo "Digite a temperatura:"
read temperatura

if [ $temperatura -gt 40 ]
then
echo "Temperatura alta"
else
echo "Temperatura normal"
fi
