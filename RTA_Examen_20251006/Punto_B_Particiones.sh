#!/bin/bash

#Busco la informacion del disco
DISCO = $(sudo fdisk -l | grep "8 G" | awk '{print $2}' | awk -F ':' '{print $1}')

#Creo las particion
sudo fdisk $DISCO << PART
n
p
1

+1G
n
p
2

+1G
n
e
3


n

+2G
n

+2G
n


w
PART
echo
echo "Mis particiones: "
sudo fdisk -l $DISCO
echo

