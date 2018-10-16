#!/bin/sh
echo "Info: 建立opt文件夹..."
/system/bin/mount -o rw,remount /
mkdir /opt
mkdir /bin
mkdir /data/opt
ln -s /system/bin/sh /bin/sh
/system/bin/mount -o ro,remount /
mount -o bind /data/opt /opt
mount -o rw,remount rootfs /
ln -s /opt/tmp /tmp
unset LD_LIBRARY_PATH
unset LD_PRELOAD

echo "Info: Checking for prerequisites and creating folders..."

if [ -d /opt ]
then
    echo "Warning: Folder /opt exists!"
else
    mkdir /opt
fi
# no need to create many folders. entware-opt package creates most
for folder in bin etc lib/opkg tmp var/lock
do
  if [ -d "/opt/$folder" ]
  then
    echo "Warning: Folder /opt/$folder exists!"
    echo "Warning: If something goes wrong please clean /opt folder and try again."
  else
    mkdir -p /opt/$folder
  fi
done

echo "Info: Opkg package manager deployment..."
DLOADER="ld-linux-aarch64.so.1"
URL=http://bin.entware.net/aarch64-k3.10/installer
wget $URL/opkg -O /opt/bin/opkg
chmod 755 /opt/bin/opkg
wget $URL/opkg.conf -O /opt/etc/opkg.conf
wget $URL/ld-2.27.so -O /opt/lib/ld-2.27.so
wget $URL/libc-2.27.so -O /opt/lib/libc-2.27.so
wget $URL/libgcc_s.so.1 -O /opt/lib/libgcc_s.so.1
wget $URL/libpthread-2.27.so -O /opt/lib/libpthread-2.27.so
cd /opt/lib
chmod 755 ld-2.27.so
ln -s ld-2.27.so $DLOADER
ln -s libc-2.27.so libc.so.6
ln -s libpthread-2.27.so libpthread.so.0
ln -s /system/etc/resolv.conf /opt/etc/resolv.conf

echo "Info: Basic packages installation..."
/opt/bin/opkg update
/opt/bin/opkg install busybox
/opt/bin/opkg install entware-opt
/opt/bin/opkg install samba36-server
/opt/bin/opkg install aria2

# Fix for multiuser environment
chmod 777 /opt/tmp

# now copy default files - it is an alternative installation
cp -f /opt/etc/passwd.1 /opt/etc/passwd
cp -f /opt/etc/passwd.1 /opt/etc/samba/smbpasswd
cp -f /opt/etc/group.1 /opt/etc/group
cp -f /opt/etc/shells.1 /opt/etc/shells

if [ -f /etc/localtime ]
then
    ln -sf /etc/localtime /opt/etc/localtime
fi

echo "Info: Congratulations!"
echo "Info: If there are no errors above then Entware was successfully initialized."
echo "Info: Add /opt/bin & /opt/sbin to your PATH variable"
echo "Info: Add '/opt/etc/init.d/rc.unslung start' to firmware startup script for Entware services to start"
echo ""
echo "This is an alternative Entware installation. We recomend to install and setup Entware version of ssh server"
echo "and use it instead of a firmware supplied one. You can install dropbear or openssh as an ssh server"

