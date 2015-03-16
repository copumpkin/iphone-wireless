
```
mkdir ~/iphone-dev
cd ~/iphone-dev
port install wget
curl -O http://landonf.bikemonkey.org/static/iphone/vfdecrypt-iphone.tar.gz
tar -zxvf vfdecrypt-iphone.tar.gz
cd vfdecrypt-iphone
make
cd ..
curl -O http://appldnld.apple.com.edgesuite.net/content.info.apple.com/iPhone/061-3538.20070629.B7vXa/iPhone1,1_1.0_1A543a_Restore.ipsw
unzip iPhone1,1_1.0_1A543a_Restore.ipsw \*.dmg
strings 694-5259-38.dmg| grep "^[0-9a-fA-F]*$" | awk '{ if (length($1) == 72) print; }'
vfdecrypt-iphone/vfdecrypt -i 694-5262-39.dmg -k <hex key> -o heavenly.dmg 
open heavenly.dmg
sudo mkdir -p /opt/local/arm-apple-darwin/heavenly
(cd /Volumes/Heavenly1A543a.UserBundle && tar cf - .) | (cd /opt/local/arm-apple-darwin/heavenly && sudo tar xvf -)
port install gmp
port install arm-apple-darwin-runtime
```