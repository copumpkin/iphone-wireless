CC=arm-apple-darwin-cc 
LD=arm-apple-darwin-cc 
LDFLAGS=-ObjC -framework CoreFoundation -framework Foundation -framework CoreTelephony

%.o:    %.m %.h %.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

all:    cellstumbler

cellstumbler:   main.c
	$(LD) $(LDFLAGS) -o $@ $^

clean : 
	rm -f *.o
	rm -f cellstumbler

