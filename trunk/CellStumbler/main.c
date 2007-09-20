#include "CoreTelephony.h"
#include <stdio.h>
#include <CoreFoundation/CoreFoundation.h>
#include <sys/time.h>

CFMachPortRef port;
struct CTServerConnection *sc=NULL;
struct CellInfo cellinfo;
int b,t1;

void hexdump(unsigned char * data, int hlen)
{
	int t;
	for(t=0;t<hlen;t++)
	{
//		if(t!=0&&t%16==0) printf("\n");
		printf("%2.2X ", data[t]);
	}
	printf("\n");
}

void callback()
{
	printf("Callback called\n");
}

void cellconnect()
{
	int t1;
	sc=_CTServerConnectionCreate(kCFAllocatorDefault, callback, NULL);
	port=CFMachPortCreateWithPort(kCFAllocatorDefault, _CTServerConnectionGetPort(sc), NULL, NULL, NULL);
	_CTServerConnectionCellMonitorStart(&t1,sc);
	printf("Connected\n");
}


int main()
{
	printf("iPhone Cell Stumbler\n");
	int cellcount;
	cellconnect();
while(1)
{
	_CTServerConnectionCellMonitorGetCellCount(&t1,sc,&cellcount);
	printf("Cell count: %x\n",cellcount);
	//cellinfo=malloc(0x24);
	unsigned char *a=malloc(0x24);
for(b=0;b<cellcount;b++)
{	
//OMG the toolchain is broken, &cellinfo doesn't work
	_CTServerConnectionCellMonitorGetCellInfo(&t1,sc,b,a); memcpy(&cellinfo,a,0x24);
//OMG the toolchain is more broken, these printfs don't work on one line
	printf("Cell Site: %d, MNC: %d, ",b,cellinfo.servingmnc);
	printf("Location: %d, Cell ID: %d, Station: %d, ",cellinfo.location, cellinfo.cellid, cellinfo.station);
	printf("Freq: %d, RxLevel: %d, ", cellinfo.freq, cellinfo.rxlevel);
	printf("C1: %d, C2: %d\n", cellinfo.c1, cellinfo.c2);
}
sleep(1);
}
	return 0;
}

