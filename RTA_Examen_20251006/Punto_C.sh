#!/bin/bash

echo "Buscamos la Clave del usuario home: "
CLAVE=$(sudo grep $(whoami) /etc/shadow | awk -F ':' '{print$2}')

echo
echo "Creamos los grupos y usuarios (con el hash): "
#Grupos
sudo groupadd p1c1_2025_g1
sudo groupadd p1c1_2025_gTodos
#Usuarios
sudo useradd -m -s /bin/bash -G p1c1_2025_g1 -p "$CLAVE" p1c1_2025_u1
sudo useradd -m -s /bin/bash -G p1c1_2025_g1 -p "$CLAVE" p1c1_2025_u2
sudo useradd -m -s /bin/bash -G p1c1_2025_gTodos -p "$CLAVE" p1c1_2025_u3


