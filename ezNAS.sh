umount /media/NAS/
echo "Configurando red:"
sleep 1
echo "    Cargando Valores"
echo "auto eth0
iface eth0 inet static
    address 192.168.0.70
    gateway 192.168.0.254
    netmask 255.255.255.0
    network 192.168.0.0
    broadcast 192.168.0.255
    dns-nameservers     9.9.9.9
" > /etc/network/interfaces
sleep 1
echo "    Desactivar interfaz:"
ifdown eth0
sleep 1
echo -e "    Esperando desactivación\c"
for i in 1 2 3 4 5
do
  echo -e ".\c"
  sleep 1
done
sleep 1
echo -e "\n    Activando Ethernet"
ifup eth0
sleep 1
echo ""
echo "Configurando NAS:"
sleep 1
echo "    Creando punto de montaje /media/NAS"
mkdir -p /media/NAS
sleep 1
echo "    Asignando permisos:"
chown demo -R /media/NAS/
sleep 1
echo "    Configurando /etc/fstab"
echo "192.168.0.50:/mnt/HD/HD_b2/Jairo /media/NAS nfs
rw,hard,intr,rsize=8191,wsize=8192,timeo=14 0 0
" > /etc/fstab
sleep 1
echo "    Montando sistama de archivos NFS"
mount -a
echo "NAS montada satisfactoriamente"
read -p " ...presione cualquier tecla para desmontar"
umount /media/NAS/
echo "NAS desmontada"
