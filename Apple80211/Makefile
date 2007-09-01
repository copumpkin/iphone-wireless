ARM_DARWIN_TOOLCHAIN=/usr/local/arm-apple-darwin
HEAVENLY=$(ARM_DARWIN_TOOLCHAIN)/heavenly

CC=$(ARM_DARWIN_TOOLCHAIN)/bin/gcc
CFLAGS=-fPIC
LDFLAGS=-Wl,-syslibroot,$(HEAVENLY) -lobjc -framework CoreFoundation -ldl -dynamiclib

objects = main.o

all:	Apple80211

Apple80211: $(objects)
	$(CC) $(LDFLAGS) -o $@ $(objects)
	mkdir -p Apple80211.framework
	cp Apple80211 Info.plist Apple80211.framework
	mkdir -p Apple80211.framework/Headers
	cp Apple80211.h Apple80211.framework/Headers

%.o:    %.c
	$(CC) $(CFLAGS) -c $(CPPFLAGS) $< -dynamic -o $@

install:
	cp -rf Apple80211.framework $(HEAVENLY)/System/Library/Frameworks/
	mkdir -p $(ARM_DARWIN_TOOLCHAIN)/arm-apple-darwin/include/Apple80211
	cp -f Apple80211.h $(ARM_DARWIN_TOOLCHAIN)/arm-apple-darwin/include/Apple80211/

clean:
	rm -f *.o Apple80211
	rm -rf Apple80211.framework