#import "MSNetworkDetailsView.h"

@implementation MSNetworkDetailsView

- (id)initWithFrame:(struct CGRect)frame
{

	self = [super initWithFrame:frame];
	ms = [StumblerApplication sharedInstance];
	
	struct CGRect rect = [UIHardware fullScreenApplicationContentRect];
	rect.origin.x = rect.origin.y = 0.0f;
	
	table = [[UITable alloc] initWithFrame:CGRectMake(0.0f, 45.0f, 320.0f, 415.0f)];
	UITableColumn *col = [[UITableColumn alloc] initWithTitle:@"Network Details" identifier:@"details" width:rect.size.width];
	[table addTableColumn:col];
	[table setSeparatorStyle:1];
	[table setRowHeight:22];
	[table setDataSource:self];
	[table setDelegate:self];
	[table reloadData];
	
	navBar = [[UINavigationBar alloc] init];
	[navBar setFrame:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, 45.0f)];
	[navBar showButtonsWithLeftTitle:@"Back" rightTitle:nil leftBack:YES];
	[navBar setDelegate:self];
	[navBar enableAnimation];
	
	[self addSubview:navBar];
	[self addSubview:table];
	
	return self;
}

- (void)reloadTableData
{
	[table reloadData];
}

#pragma mark ----------Delegate Methods-----------
- (void)navigationBar:(UINavigationBar*)bar buttonClicked:(int)button
{
	[ms showNetworksViewWithTransition:2];
}
- (void)tableRowSelected:(NSNotification *)notification
{
}

#pragma mark ----------Datasource Methods-----------
- (int)numberOfRowsInTable:(UITable *)table
{
	NSLog(@"numberOfRowsInTable");
	return 9;
}

- (UITableCell *)table:(UITable *)table cellForRow:(int)row column:(int)col
{	
	NSLog(@"cellForRow: %d,%d",row,col);
  /*
    * SSID_STR - A CFString containing the ESSID (network name) of the network
    * RSN_IE - A CFDictionary of information on the RSN
    * WEP - A CFBoolean indicating whether the network is WEP-enabled
    * RSSI - An integer CFNumber indicating signal strength (wikipedia)
    * AP_MODE - An integer CFNumber (possibly showing whether the network is from an AP or is an ad-hoc network)
    * SSID - A CFData (doesn't seem to match the SSID of the network, but maybe it's mangled somehow)
    * CHANNEL - An integer CFNumber of the channel the network was seen on
    * CHANNEL_FLAGS - An integer CFNumber (though I don't know what channel flags exist)
    * BEACON_INT - An integer CFNumber probably indicating the network's beacon interval (but I don't know the units yet)
    * CAPABILITIES - An integer CFNumber probably containing flags for the network's capabilities (possibly whether it's a/b/g?)
    * scanWasDirected - A CFBoolean possibly indicating whether the scan was specifically directed at the network?
    * IE - A CFData containing miscellaneous information elements found on the beacons (I'm assuming)
    * APPLE_IE - A CFDictionary containing parsed Apple-specific (from Airport base stations) properties
    * BSSID - A CFString containing a standard colon-separated BSSID (MAC address) but that doesn't have leading 0's in the case of single hex digits
    * HIDDEN_NETWORK - A CFBoolean indicating whether the network is hidden (implies that it's performing a passive scan – verified)
    * AGE - An integer CFNumber possibly indicating whether this is a cached network from a previous scan?
    * NOISE - An integer CFNumber that appears to quantify how noisy the network signal is 
	*/
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	float transparentComponents[4] = {0, 0, 0, 0};
	float grayComponents[4] = {0.55, 0.55, 0.55, 1};
	float blueComponents[4] = {0.208, 0.482, 0.859, 1};
	
	//Create description label
	UITextLabel *descriptionLabel = [[UITextLabel alloc] initWithFrame:CGRectMake(5.0f, 3.0f, 155.0f, 18.0f)];
	[descriptionLabel setWrapsText:NO];
	[descriptionLabel setColor:CGColorCreate(colorSpace, blueComponents)];
	[descriptionLabel setBackgroundColor:CGColorCreate(colorSpace, transparentComponents)];
	
	UITextLabel *valueLabel = [[UITextLabel alloc] initWithFrame:CGRectMake(155.0f, 3.0f, 210.0f, 18.0f)];
	[valueLabel setBackgroundColor:CGColorCreate(colorSpace, transparentComponents)];
	[valueLabel setWrapsText:YES];
	NSString* val;
	switch (row)
	{
		case 0:
			[descriptionLabel setText:@"SSID:"];
			if ([[[ms currentNetwork] objectForKey: @"HIDDEN_NETWORK"] boolValue]) {
				[valueLabel setText: @"<hidden>"];
	    } else {
	    	[valueLabel setText:[[ms currentNetwork] objectForKey:@"SSID_STR"]];
	    }
			break;
		case 1:
			[descriptionLabel setText:@"BSSID:"];
			[valueLabel setText:[[ms currentNetwork] objectForKey:@"BSSID"]];
			break;
		case 2:
			[descriptionLabel setText:@"Channel:"];
			val = [NSString stringWithFormat: @"%@", [[ms currentNetwork] objectForKey:@"CHANNEL"]];
			[valueLabel setText:val];
			break;
		case 3:
			[descriptionLabel setText:@"AP Mode:"];
			val = [NSString stringWithFormat: @"%@", [[ms currentNetwork] objectForKey:@"AP_MODE"]];
			[valueLabel setText:val];
			break;
		case 4:
			[descriptionLabel setText:@"WPA:"];
			[valueLabel setText:([[ms currentNetwork] objectForKey:@"WPA_IE"] ? @"YES":@"NO")];
			break;
		case 5:
			[descriptionLabel setText:@"WEP:"];
			[valueLabel setText:([[[ms currentNetwork] objectForKey:@"WEP"] boolValue] ? @"YES":@"NO")];
			break;
		case 6:
			[descriptionLabel setText:@"Signal Strength:"];
			val = [NSString stringWithFormat: @"%@", [[ms currentNetwork] objectForKey:@"RSSI"]];
			[valueLabel setText:val];
			break;
		case 7:
			[descriptionLabel setText:@"Hidden Network:"];
			[valueLabel setText:([[[ms currentNetwork] objectForKey:@"HIDDEN_NETWORK"] boolValue] ? @"YES":@"NO")];
			break;
		case 8:
			[descriptionLabel setText:@"Beacon Interval:"];
			val = [NSString stringWithFormat: @"%@", [[ms currentNetwork] objectForKey:@"BEACON_INT"]];
			[valueLabel setText:val];
			break;
		default:
			break;
	}
	
	
	UITableCell *cell = [[UITableCell alloc] init];
	[cell addSubview:descriptionLabel];
	[cell addSubview:valueLabel];
	[cell setShowDisclosure:NO];
	return cell;
}

- (BOOL)table:(UITable*)table canSelectRow:(int)row
{
	return false;
}

@end