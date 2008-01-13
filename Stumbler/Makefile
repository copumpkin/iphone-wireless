VERSION=0.04.`date +%s`
CC=arm-apple-darwin-gcc
LD=$(CC)
CFLAGS=
LDFLAGS=-lobjc -framework CoreFoundation -framework Foundation -framework UIKit -framework LayerKit -framework CoreGraphics
all:    Stumbler

Stumbler:  stumbler.o StumblerApplication.o MSNetworksView.o MSNetworkDetailsView.o MSNetworksManager.o
	$(LD) $(LDFLAGS) -o $@ $^
	@echo $(VERSION)>VERSION

%.o:    %.m
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

test:	package deploy
	@echo running application...
	@cp resources/test.sh deploy/test.sh
	@(cd deploy && sh test.sh)

package: FORCE
	@echo package files...
	@mkdir -p deploy/Stumbler.app
	@chmod o+rwx,g+rwx,a+rx Stumbler
	@cp Stumbler deploy/Stumbler.app/Stumbler
	@cp resources/icon.png deploy/Stumbler.app/icon.png
	@cp resources/Default.png deploy/Stumbler.app/Default.png
	@cp resources/Info.plist deploy/Stumbler.app/Info.plist

deploy:	FORCE
	@echo sending the files...
	@cp resources/deploy.sh deploy/deploy.sh
	@(cd deploy && sh deploy.sh)

clean:	FORCE
	rm -f *.o Stumbler
	rm -rf deploy

FORCE:

