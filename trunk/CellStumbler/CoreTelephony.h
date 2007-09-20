#include <CoreFoundation/CoreFoundation.h>

//Functions I'm sure about
struct CTServerConnection
{
	int a;
	int b;
	CFMachPortRef myport;
	int c;
	int d;
	int e;
	int f;
	int g;
	int h;
	int i;
};

struct CellInfo
{
	int servingmnc;
	int network;
	int location;
	int cellid;
	int station;
	int freq;
	int rxlevel;
	int c1;
	int c2;
};

struct CTServerConnection * _CTServerConnectionCreate(CFAllocatorRef, void *, int *);	//the void* is a callback
mach_port_t _CTServerConnectionGetPort(struct CTServerConnection *);
int *_CTServerConnectionCellMonitorStart(int *,struct CTServerConnection *);

void _CTServerConnectionRegisterForNotification(void *, struct CTServerConnection *, void *); //kCTCellMonitorUpdateNotification
void kCTCellMonitorUpdateNotification();

int *_CTServerConnectionCellMonitorGetCellCount(int *,struct CTServerConnection *,int *);
int *_CTServerConnectionCellMonitorGetCellInfo(int *,struct CTServerConnection *,int, struct CellInfo *);	//3rd is cell tower num
