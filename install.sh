#!/bin/sh

echo "Atualiza pacotes"
apt -y update

echo "Instalar [WGET]"
apt install wget -y


echo "Download Nessus"
cd /tmp && wget "https://github.com/greenmind-sec/nessus-server/raw/master/Nessus-8.11.0-debian6_amd64.deb"

echo "Install Nessus"
cd /tmp && dpkg -i Nessus-8.11.0-debian6_amd64.deb

echo "Iniciar [Nessus]"
/etc/init.d/nessusd start
systemctl start nessusd

echo "Enable [Nessus]"
systemctl enable nessusd

echo "Status Nessus"
systemctl status nessusd
