VERSION=0.04.`date +%s`
CC=arm-apple-darwin-cc
LD=$(CC)
CFLAGS=
LDFLAGS=-lobjc -framework CoreFoundation -framework Foundation -framework UIKit -framework LayerKit -framework CoreGraphics
all:    Stumbler

Stumbler:  stumbler.o StumblerApplication.o MSNetworksView.o MSNetworkDetailsView.o
	$(LD) $(LDFLAGS) -o $@ $^
	@echo $(VERSION)>VERSION

%.o:    %.m
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

package:
	@echo bulding package files
	@mkdir -p deploy/Stumbler.app
	@chmod o+rwx,g+rwx,a+rx Stumbler
	@cp Stumbler deploy/Stumbler.app/Stumbler
	@cp resources/icon.png deploy/Stumbler.app/icon.png
	@cp resources/Default.png deploy/Stumbler.app/Default.png
	@cp resources/Info.plist deploy/Stumbler.app/Info.plist
	@cp resources/package.pl deploy/package.pl
	@cp resources/package.config deploy/package.config
	@(cd deploy && perl package.pl)
	@echo done packaging, now you can publish

publish:
	@echo sending the files...
	@cp resources/deploy.sh deploy/deploy.sh
	@(cd deploy && sh deploy.sh)
	@echo all done!


clean:
	rm -f *.o Stumbler
	rm -rf deploy
