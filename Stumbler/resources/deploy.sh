NAME=Stumbler
CAT=iPhonelets
USER=lokkju
REPO=iphonelets.com:sites/iphonelets/repository
VERSION=`cat ../VERSION`
scp -p $NAME-$VERSION.zip $USER@$REPO/zips/
scp -p $NAME.plist $USER@$REPO/plists/$CAT/

