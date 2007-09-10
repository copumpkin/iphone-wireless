
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
static StumblerApplication *sharedInstance;
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
+ (StumblerApplication *)sharedInstance
{
	if (!sharedInstance)
		sharedInstance = [[StumblerApplication alloc] init];
	
	return sharedInstance;
}
- (void) applicationDidFinishLaunching: (id) unused
{
    sharedInstance = self;
    struct CGRect rect = [UIHardware fullScreenApplicationContentRect];
    rect.origin.x = rect.origin.y = 0.0f;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    float whiteComponents[4] = {1, 1, 1, 1};
    float transparentComponents[4] = {0, 0, 0, 0};
    transitionView = [[UITransitionView alloc] initWithFrame:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)];
    mainView = [[UIView alloc] initWithFrame:rect];
    [mainView addSubview:transitionView];
    mainWindow = [[UIWindow alloc] initWithContentRect:rect];
    [mainWindow setContentView:mainView];
    [mainWindow orderFront:self];
    [mainWindow makeKey:self];
    [mainWindow _setHidden:NO];
    [self showNetworksViewWithTransition:1];
}
- (void)enableiPhonePreference
{
}
- (void)showNetworksViewWithTransition:(int)trans
{
	if (!networksView)
	{
		struct CGRect rect = [UIHardware fullScreenApplicationContentRect];
		rect.origin.x = rect.origin.y = 0.0f;
		networksView = [[MSNetworksView alloc] initWithFrame:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)];
	}
	[transitionView transition:trans toView:networksView];
}
@end
