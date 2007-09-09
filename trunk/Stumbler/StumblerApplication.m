
#import "StumblerApplication.h"

@implementation StumblerTableCell

- (id) initWithNetwork: (NSDictionary *)network
{
    self = [super init];
    network_name = [[UITextLabel alloc] initWithFrame: CGRectMake(9.0f, 7.0f, 260.0f, 29.0f)];
    bssid = [[UITextLabel alloc] initWithFrame: CGRectMake(10.0f, 26.0f, 260.0f, 34.0f)];

    float c[] = { 0.0f, 0.0f, 0.0f, 0.0f };
    float h[] = { 1.0f, 1.0f, 1.0f, 1.0f };
    
    if ([[network objectForKey: @"HIDDEN_NETWORK"] boolValue]) {
        [network_name setText: @"<hidden>"];
    } else {
        [network_name setText: [network objectForKey: @"SSID_STR"]];
    }
    [network_name setFont: [UIImageAndTextTableCell defaultTitleFont]];
    [network_name setBackgroundColor: CGColorCreate(CGColorSpaceCreateDeviceRGB(), c)];
    [network_name setHighlightedColor: CGColorCreate(CGColorSpaceCreateDeviceRGB(), h)];
    
    [bssid setText: [network objectForKey: @"BSSID"]];
    [bssid setFont: [UIDateLabel defaultFont]];
    [bssid setColor: CGColorCreateCopyWithAlpha([bssid color], 0.4f)];
    [bssid setBackgroundColor: CGColorCreate(CGColorSpaceCreateDeviceRGB(), c)];
    [bssid setHighlightedColor: CGColorCreate(CGColorSpaceCreateDeviceRGB(), h)];

    
    [self addSubview: bssid];
    [self addSubview: network_name];

    [self setShowDisclosure: YES];
    [self setDisclosureStyle: 1];

    return self;
}

- (void) drawContentInRect: (struct CGRect)rect selected: (BOOL) selected
{
    [network_name setHighlighted: selected];
    [bssid setHighlighted: selected];
    
    [super drawContentInRect: rect selected: selected];
}

@end

@implementation StumblerApplication
- (void) showAlert: (NSString *) msg
{
	NSMutableArray *buttons = [[NSMutableArray alloc] init];
	[buttons addObject:[NSString stringWithString:@"OK"]];
	UIAlertSheet *alert = [[UIAlertSheet alloc]
		initWithTitle:@"Alert"
		buttons:buttons
		defaultButtonIndex:0
		delegate:self
		context:self];
	[alert setBodyText:msg];
	[alert _slideSheetOut:YES];
	[alert setRunsModal:YES];
	[alert popupAlertAnimated:YES];
}
- (void) alertSheet:(UIAlertSheet *)sheet buttonClicked:(int) bnum
{
	[sheet dismiss];
}
- (int) numberOfRowsInTable: (UITable *)table
{
    return [openNetworks count] + [protectedNetworks count];
}

- (NSDictionary *) itemForIndex: (int)index
{
    if (index < [openNetworks count]) {
        return [openNetworks objectAtIndex: index];
    } else {
        return [protectedNetworks objectAtIndex: index - [openNetworks count]];        
    }
}

- (BOOL) isProtected: (NSDictionary *)network
{
    return ([network objectForKey:@"WEP"] && [[network objectForKey:@"WEP"] boolValue]) || [network objectForKey:@"WPA_IE"];
}

- (UITableCell *) table: (UITable *)table cellForRow: (int)row column: (int)col
{
    StumblerTableCell *cell = [[StumblerTableCell alloc] initWithNetwork: [self itemForIndex: row]];
    
    return cell;
}

- (UITableCell *) table: (UITable *)table cellForRow: (int)row column: (int)col
    reusing: (BOOL) reusing
{
    return [self table: table cellForRow: row column: col];
}

- (void)scan
{
    NSArray *networks;
    NSDictionary *parameters = [[NSDictionary alloc] init];
        
    scan(airportHandle, &networks, parameters);
        
    [openNetworks removeAllObjects];
    [protectedNetworks removeAllObjects];
    
    int i;
    for (i = 0; i < [networks count]; i++) {
        if ([self isProtected: [networks objectAtIndex: i]]) {
            [protectedNetworks addObject: [networks objectAtIndex: i]];
        } else {
            [openNetworks addObject: [networks objectAtIndex: i]];            
        }
	NSDictionary *net = [networks objectAtIndex: i];
	NSEnumerator *netenum = [net keyEnumerator];
	id key;
	while ((key = [netenum nextObject])) {
		NSLog(@"%@:%@",key,[net objectForKey: key]);
	}
    }
    
    [title setTitle:[NSString stringWithFormat:@"Networks (%d)", [openNetworks count] + [protectedNetworks count]]];
}


- (void)navigationBar:(UINavigationBar*)navbar buttonClicked:(int)button 
{
    [self scan];
    
    [sectionList reloadData];
}

- (int)numberOfSectionsInSectionList:(UISectionList *)aSectionList {
    int count = 0;
    if ([openNetworks count] > 0) {
        count++;
    }
    
    if ([protectedNetworks count] > 0) {
        count++;
    }
    
    return count;
}
        
- (NSString *)sectionList:(UISectionList *)aSectionList titleForSection:(int)section {    
    if (section == 1) {
        return @"Protected"; 
    } else {
        return @"Open";
    }
}       
        
- (int)sectionList:(UISectionList *)aSectionList rowForSection:(int)section {
    if (section == 1) {
        return [openNetworks count]; 
    } else {
        return 0;
    }
}

- (void) applicationDidFinishLaunching: (id) unused
{
    UIWindow *window;

    window = [[UIWindow alloc] initWithContentRect: [UIHardware
        fullScreenApplicationContentRect]];
        
    [window orderFront: self];
    [window makeKey: self];
    [window _setHidden: NO];
 
    UINavigationBar *nav = [[UINavigationBar alloc] initWithFrame: CGRectMake(
        0.0f, 0.0f, 320.0f, 48.0f)];
    [nav showButtonsWithLeftTitle: nil rightTitle: @"Rescan" leftBack: YES];
    [nav setBarStyle: 0];
    [nav setDelegate: self];

    title = [[UINavigationItem alloc] initWithTitle: @"Networks"];
    [nav pushNavigationItem: title];

    struct CGRect rect = [UIHardware fullScreenApplicationContentRect];
    rect.origin.x = rect.origin.y = 0.0f;
    UIView *mainView;
    mainView = [[UIView alloc] initWithFrame: rect];

    libHandle = dlopen("/System/Library/Frameworks/Preferences.framework/Preferences", RTLD_LAZY);

    open = dlsym(libHandle, "Apple80211Open");
    bind = dlsym(libHandle, "Apple80211BindToInterface");
    close = dlsym(libHandle, "Apple80211Close");
    scan = dlsym(libHandle, "Apple80211Scan");
    
    open(&airportHandle);
    bind(airportHandle, @"en0");
    
    openNetworks = [[NSMutableArray alloc] init];
    protectedNetworks = [[NSMutableArray alloc] init];
    
    [self scan];
    
    [mainView addSubview: nav]; 
    
    sectionList = [[UISectionList alloc] initWithFrame:CGRectMake(0.0f, 48.0f, 320.0f, 480.0f - 16.0f - 32.0f) showSectionIndex:NO];
    [sectionList setDataSource:self];
    [sectionList reloadData];
    [mainView addSubview:sectionList];

    UISectionTable *table = [sectionList table];
    [table setShouldHideHeaderInShortLists:NO];
    UITableColumn *packageColumn = [[UITableColumn alloc] initWithTitle:@"Network Name" identifier:@"name" width:320.0f];

    [table addTableColumn:packageColumn];
    [table setSeparatorStyle:1];
    [table setRowHeight:64.0f];
    [table setDelegate:self];
    
    [window setContentView: mainView]; 
}

@end
