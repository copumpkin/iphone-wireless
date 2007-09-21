#include "CoreTelephony.h"
#include <stdio.h>
#include <CoreFoundation/CoreFoundation.h>
#include <sys/time.h>

/*
	main.c : Hack to CoreTelephony. Most of the peculiarities of the code below is based on obervation. 
*/

/*
	For some reason, all these variables have to be global. Toolchain bug?
*/
CFMachPortRef port;
struct CTServerConnection *sc=NULL;
struct CellInfo cellinfo;
int b;
int t1;

/* 
	Never called.
*/
void callback()
{
	printf("Callback called\n");
}

/*
 	Again, _CTServerConnectionCreate() has to be called outside the main(), or whatever is using CTServerConnection. 
	Hence the existence of this function.
*/
	
void cellconnect()
{
	int t1;
	sc=_CTServerConnectionCreate(kCFAllocatorDefault, callback, NULL);

	/*
		port is not currently used, shuld be usable with a runloop.
	*/
	port=CFMachPortCreateWithPort(kCFAllocatorDefault, _CTServerConnectionGetPort(sc), NULL, NULL, NULL);

	_CTServerConnectionCellMonitorStart(&t1,sc);

	printf("Connected\n");
}

void getCellInfo()
{
	int cellcount;
	_CTServerConnectionCellMonitorGetCellCount(&t1,sc,&cellcount);

	printf("Cell count: %x\n",cellcount);

	printf("Size = %x\n", sizeof(struct CellInfo));

	unsigned char *a=malloc(sizeof(struct CellInfo));

	for(b=0;b<cellcount;b++)
	{	
		//OMG the toolchain is broken, &cellinfo doesn't work
		_CTServerConnectionCellMonitorGetCellInfo(&t1,sc,b,a); memcpy(&cellinfo,a,sizeof(struct CellInfo));
		//OMG the toolchain is more broken, these printfs don't work on one line
		printf("Cell Site: %d, MNC: %d, ",b,cellinfo.servingmnc);
		printf("Location: %d, Cell ID: %d, Station: %d, ",cellinfo.location, cellinfo.cellid, cellinfo.station);
		printf("Freq: %d, RxLevel: %d, ", cellinfo.freq, cellinfo.rxlevel);
		printf("C1: %d, C2: %d\n", cellinfo.c1, cellinfo.c2);
	}
	if(a) free(a);

}

int main()
{
	printf("iPhone Cell Stumbler\n");
	cellconnect();
	int cellcount;
	while(1)
	{
		getCellInfo();
		sleep(1);
	}
	return 0;
}

