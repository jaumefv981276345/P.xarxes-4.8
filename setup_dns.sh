#!/bin/bash
# Script de instalación y configuración de DNS para auroradata.com
# Debe ejecutarse como root

set -e

echo "=== Instalando Bind9 y utilidades ==="
apt update
apt install bind9 bind9-utils bind9-dnsutils -y

echo "=== Copiando archivos de configuración ==="
cp named.conf.local /etc/bind/named.conf.local
cp db.auroradata.com /etc/bind/db.auroradata.com
cp db.estacions.auroradata.com /etc/bind/db.estacions.auroradata.com
cp db.10.18.55 /etc/bind/db.10.18.55

echo "=== Verificando sintaxis de configuración ==="
named-checkconf /etc/bind/named.conf.local
named-checkzone auroradata.com /etc/bind/db.auroradata.com
named-checkzone estacions.auroradata.com /etc/bind/db.estacions.auroradata.com
named-checkzone 55.18.10.in-addr.arpa /etc/bind/db.10.18.55

echo "=== Reiniciando Bind9 ==="
systemctl restart bind9
systemctl status bind9 --no-pager

echo "=== Recargando zonas con rndc ==="
rndc reload auroradata.com
rndc reload estacions.auroradata.com
rndc reload 55.18.10.in-addr.arpa

echo "=== DNS instalado y configurado correctamente ==="
echo "Puedes probar con: dig @localhost auroradata.com"
