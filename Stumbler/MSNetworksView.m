#import "MSNetworksView.h"

@implementation MSNetworksView

- (id)initWithFrame:(struct CGRect)frame
{
	self = [super initWithFrame:frame];
	
	ms = [StumblerApplication sharedInstance];
	//Get full screen app rect
	struct CGRect rect = [UIHardware fullScreenApplicationContentRect];
	rect.origin.x = rect.origin.y = 0.0f;
	
	navBar = [[UINavigationBar alloc] init];
	[navBar setFrame:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, 45.0f)];
	[navBar showLeftButton:@"Quit" withStyle:0 rightButton:@"Rescan" withStyle:0];
	//[navBar showButtonsWithLeftTitle:nil rightTitle:@"Rescan" leftBack:YES];
	title = [[UINavigationItem alloc] initWithTitle: @"Networks"];
  [navBar pushNavigationItem: title];
	[navBar setDelegate:self];
	//[navBar enableAnimation];

	openNetworks = [[NSMutableArray alloc] init];
	protectedNetworks = [[NSMutableArray alloc] init];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networksUpdated:) name:@"NetworksUpdated" object:nil];
	//[[ms networksManager] scan];
	sectionList = [[UISectionList alloc] initWithFrame:CGRectMake(rect.origin.x, 45.0f, rect.size.width, rect.size.height - 45.0f) showSectionIndex:NO];
	[sectionList setDataSource:self];
	[sectionList reloadData];

	stable = [sectionList table];
	[stable setShouldHideHeaderInShortLists:NO];
  UITableColumn *packageColumn = [[UITableColumn alloc] initWithTitle:@"Network Name" identifier:@"name" width:320.0f];
	[stable addTableColumn:packageColumn];
	[stable setSeparatorStyle:1];
	[stable setRowHeight:64.0f];
	[stable setDelegate:self];
	[self addSubview:navBar];
	[self addSubview:sectionList];
	return self;
}


- (BOOL) isProtected: (NSDictionary *)network
{
		return (([network objectForKey:@"WEP"] && [[network objectForKey:@"WEP"] boolValue]) || [network objectForKey:@"WPA_IE"]);
}


- (void)networksUpdated:(NSNotification *)notification
{
    NSArray *networks = [[[ms networksManager] networks] allValues];
    NSDictionary *parameters = [[NSDictionary alloc] init];    
    [openNetworks removeAllObjects];
    [protectedNetworks removeAllObjects];
    
    int i;
    for (i = 0; i < [networks count]; i++) {
        if ([self isProtected: [networks objectAtIndex: i]]) {
            NSLog(@"Adding to protected networks");
            [protectedNetworks addObject: [networks objectAtIndex: i]];
        } else {
            NSLog(@"Adding to open networks");
            [openNetworks addObject: [networks objectAtIndex: i]];            
        }
	//NSDictionary *net = [networks objectAtIndex: i];
	//NSEnumerator *netenum = [net keyEnumerator];
	//id key;
	//while ((key = [netenum nextObject])) {
	//	CFShow([net objectForKey: key]);
	//	NSLog(@"%@:%@",key,[net objectForKey: key]);
	//}
		}
		[sectionList reloadData];
    [title setTitle:[NSString stringWithFormat:@"Networks (%d)", [openNetworks count] + [protectedNetworks count]]];
}


#pragma mark ----------Delegate Methods-----------
- (void)navigationBar:(UINavigationBar*)navbar buttonClicked:(int)button 
{
	NSLog(@"Clicked Button: %i", button);
	if (button == 0) { // Rescan
		[[ms networksManager] scan];
	} else if ( button == 1) { //Exit 
		exit(0);
	}
}
- (void)tableRowSelected:(NSNotification *)notification
{
	[ms showNetworkDetailsViewWithTransition:1 : [[self itemForIndex:[stable selectedRow]] objectForKey:@"BSSID"]];
}

#pragma mark ----------Datasource Methods-----------

- (NSDictionary *) itemForIndex: (int)index
{
    if (index < [openNetworks count]) {
        return [openNetworks objectAtIndex: index];
    } else {
        return [protectedNetworks objectAtIndex: index - [openNetworks count]];        
    }
}

- (int) numberOfRowsInTable: (UITable *)table
{
    return [openNetworks count] + [protectedNetworks count];
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

#pragma mark ----------SectionList Methods-----------

- (int)numberOfSectionsInSectionList:(UISectionList *)aSectionList {
    return 2;
}
        
- (NSString *)sectionList:(UISectionList *)aSectionList titleForSection:(int)section {    
    NSLog(@"Section: %d",section);
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

@end