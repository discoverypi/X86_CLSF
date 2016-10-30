mv /Pi/clfs/toolsx /Pi/toolsx
mv /Pi/clfs/tools /Pi/tools
cd /Pi/clfs
find /Pi/clfs -user pi -exec chown root:root {} \;
find /Pi/clfs -type d -user pi -exec chown root:root {} \;
find /Pi/clfs -type l -user pi -exec chown -h root:root {} \;
ln -s usr /Pi/clfs/toolsx
ln -s ../../bin/bash /Pi/clfs/usr/bin
cp /Pi/src/ld.so.conf /Pi/clfs/etc/ld.so.conf
cp /Pi/src/ld.so.cache /Pi/clfs/etc/ld.so.cache
cd /Pi/clfs/etc
tar -xf /Pi/src/pass.tar
chmod +s /Pi/clfs/bin/su
cd /Pi/clfs/usr/share/zoneinfo
tar -xf /Pi/src/zoneinfo.tar
cd /Pi/clfs 
touch .postpkg
grep -Irl toolsx /Pi/clfs/usr/* > /tmp/t.log
fixtoolsx.sh /tmp/t.log
cp -r /Pi/firmware/boot /Pi/clfs/boota
cp -r /Pi/clfs/boot/* /Pi/clfs/boota/.
mv /Pi/clfs/boot /Pi/boot.org
mv /Pi/clfs/boota  /Pi/clfs/boot
cd /Pi/clfs/lib/modules/
ln -s 4.4.8-v7 4.4.8-v7+
mkdir /Pi/clfs/usr/share/pios
cp /Pi/postpkg.tar /Pi/clfs/usr/share/pios/.
cd /Pi/clfs/etc/pam.d
tar -xf /Pi/src/pam.d.tar
cd /Pi/clfs/etc/rc.d
tar -xf /Pi/src/rc.d.tar

