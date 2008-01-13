# TARGET should be your iphone's ip.  I use /etc/hosts to link iphone to the ip
TARGET=iphone
NAME=Stumbler
USER=root
VERSION=`cat VERSION`
echo Running Application...
ssh -t $USER@$TARGET /Applications/$NAME-$VERSION.app/$NAME
ssh $USER@$TARGET rm -rf /Applications/$NAME-$VERSION.app

