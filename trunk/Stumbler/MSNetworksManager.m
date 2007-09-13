#import "MSNetworksManager.h"

static MSNetworksManager *NetworksManager;

@implementation MSNetworksManager

+ (MSNetworksManager *)sharedNetworksManager
{
	if (!NetworksManager)
		NetworksManager = [[MSNetworksManager alloc] init];
	return NetworksManager;
}
+ (NSNumber *)numberFromBSSID:(NSString *) bssid
{
	int x = 0;
	uint64_t longmac;
	int MAC_LEN = 6;
	short unsigned int *bs_in = malloc(sizeof(short unsigned int) * MAC_LEN);
	if (sscanf([bssid cStringUsingEncoding: [NSString defaultCStringEncoding]],"%hX:%hX:%hX:%hX:%hX:%hX",&bs_in[0], &bs_in[1], &bs_in[2], &bs_in[3], &bs_in[4], &bs_in[5]) == MAC_LEN)
	{
		for (x = 0; x < MAC_LEN; x++)
     longmac |= (uint64_t) bs_in[x] << ((MAC_LEN - x - 1) * 8);
	} else {
		NSLog(@"WARN: invalid mac address! %@",self);
	}
	free(bs_in);
	return [NSNumber numberWithUnsignedLongLong:longmac];
}

- (NSDictionary *)networks
{
	// TODO: Implement joining of network types
	return networks;
}
- (NSDictionary *)networks:(int) type
{
	// TODO: Implement selecting of network types
	if(type != 0)
		NSLog(@"WARN: Non 80211 networks are not supported. %@",self);
	return networks;
}
- (NSDictionary *)network:(NSString *) aNetwork
{
	return [networks objectForKey: aNetwork];
}
- (id)init
{
	self = [super init];
	NetworksManager = self;
	networks = [[NSMutableDictionary alloc] init];
	types = [NSArray arrayWithObjects:@"80211", @"Bluetooth", @"GSM", nil];
	[types retain];
	autoScanInterval = 10; //seconds
	libHandle = dlopen("/System/Library/Frameworks/Preferences.framework/Preferences", RTLD_LAZY);
	open = dlsym(libHandle, "Apple80211Open");
	bind = dlsym(libHandle, "Apple80211BindToInterface");
	close = dlsym(libHandle, "Apple80211Close");
	scan = dlsym(libHandle, "Apple80211Scan");
    
	open(&airportHandle);
	bind(airportHandle, @"en0");
	return self;
}
- (void)dealloc
{
	close(&airportHandle);
	[super dealloc];
}
- (int)numberOfNetworks
{
	return [networks count];
}
- (int)numberOfNetworks:(int) type
{
	// TODO: Implement selecting of network types
	if(type != 0)
		NSLog(@"WARN: Non 80211 networks are not supported. %@",self);
	return [networks count];
}
- (int)autoScanInterval
{
	return autoScanInterval;
}
- (void)scan
{
	NSArray *scan_networks;
	NSDictionary *parameters = [[NSDictionary alloc] init];
	scan(airportHandle, &scan_networks, parameters);
	int i;
	bool changed;
	for (i = 0; i < [scan_networks count]; i++) {
		if([networks objectForKey:[[scan_networks objectAtIndex: i] objectForKey:@"BSSID"]] != nil && ![[networks objectForKey:[[scan_networks objectAtIndex: i] objectForKey:@"BSSID"]] isEqualToDictionary:[scan_networks objectAtIndex: i]])
			changed = true;
		[networks setObject:[scan_networks objectAtIndex: i] forKey:[[scan_networks objectAtIndex: i] objectForKey:@"BSSID"]];
	}
	if(changed) {
		[[NSNotificationCenter defaultCenter] postNotificationName:@"NetworksUpdated" object:self];
	}
}
- (void)removeNetwork:(NSString *)aNetwork
{
	[networks removeObjectForKey:aNetwork];
}
- (void)removeAllNetworks
{
	[networks removeAllObjects];
}
- (void)removeAllNetworks:(int) type
{
	if(type != 0)
		NSLog(@"WARN: Non 80211 networks are not supported. %@",self);
	[networks removeAllObjects];
}
- (void)autoScan:(BOOL) scan
{
	NSLog(@"WARN: Automatic scanning not supported yet. %@",self);
}
- (void)setAutoScanInterval:(int) scanInterval
{
	autoScanInterval = scanInterval;
}

@end