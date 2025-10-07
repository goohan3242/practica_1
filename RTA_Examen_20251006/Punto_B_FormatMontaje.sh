#!/bin/bash 


DISCO_PART = $(sudo fdisk -l | grep "8 G" | awk '{print $2}' | awk -F ':' '{print $1}')
echo "Formateo mis particiones: "
sudo fdisk -l /dev/sdc | grep '/dev/sdc'| grep -viE 'Disk|exten'| awk '{print"sudo mkfs.ext4"$1}'|/bin/bash
echo
echo "Monto de manera persistente las particiones: "

cat << MONT | sudo tee -a /etc/fstab

${DISCO_PART}1 /Astronomia/Planeta/Gravedad ext4  defaults  0 0 | sudo tee -a /etc/fstab
${DISCO_PART}2 /Astronomia/Planeta/Orbita ext4  defaults  0 0 | sudo tee -a /etc/fstab
${DISCO_PART}5 /Astronomia/Cometa/Cola ext4  defaults  0 0 | sudo tee -a /etc/fstab
${DISCO_PART}6 /Astronomia/Cometa/Gravedad ext4  defaults  0 0 | sudo tee -a /etc/fstab
${DISCO_PART}7 /Astronomia/Cometa/Orbita ext4  defaults  0 0 | sudo tee -a /etc/fstab

MONT

echo "Recargamos: "
sudo systemctl daemon-reload

echo
echo "Montamos todo: "
sudo mount -a
echo "Reiniciamos para que quede todo correcto y luego de eso se puede usar el comando sudo df -h para ver como quedo todo montado"
sudo reboot

