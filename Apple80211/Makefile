CC=/Developer/SDKs/iPhone/bin/arm-apple-darwin-cc
LD=$(CC)
CFLAGS=-fPIC 
LDFLAGS=-lobjc -framework CoreFoundation -dynamic

objects = main.o

all:	Apple80211

Apple80211: $(objects)
	$(LD) $(LDFLAGS) -o $@ $(objects)
	mkdir -p Apple80211.framework
	cp Apple80211 Info.plist Apple80211.framework
	mkdir -p Apple80211.framework/Headers
	cp Apple80211.h Apple80211.framework/Headers

%.o:    %.c
	$(CC) $(CFLAGS) -c $(CPPFLAGS) $< -dynamic -o $@

install:
	cp -r Apple80211.framework /usr/local/arm-apple-darwin/heavenly/System/Library/Frameworks/
	mkdir -p /usr/local/arm-apple-darwin/arm-apple-darwin/include/Apple80211
	cp Apple80211.h /usr/local/arm-apple-darwin/arm-apple-darwin/include/Apple80211/

clean:
	rm -f *.o Apple80211
	rm -rf Apple80211.framework