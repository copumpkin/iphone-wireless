#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h>
#import <UIKit/CDStructures.h>
#import <UIKit/UIPushButton.h>
#import <UIKit/UIThreePartButton.h>
#import <UIKit/UIWindow.h>
#import <UIKit/UIView-Hierarchy.h>
#import <UIKit/UIView.h>
#import <UIKit/UITransitionView.h>
#import <UIKit/UIHardware.h>
#import <UIKit/UITable.h>
#import <UIKit/UIDateLabel.h>
#import <UIKit/UISectionList.h>

#import <UIKit/UITableCell.h>
#import <UIKit/UITableColumn.h>

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UIKit/UIApplication.h>
#import <UIKit/UIPushButton.h>
#import <UIKit/UITableCell.h>
#import <UIKit/UINavigationBar.h>
#import <UIKit/UINavigationItem.h>

#import <UIKit/UIImageAndTextTableCell.h>
#include <dlfcn.h>

#import "MSNetworkDetailsView.h"
#import "MSNetworksView.h"

@class MSNetworkDetailsView;
@class MSNetworksView;

@interface StumblerTableCell : UITableCell {
    UITextLabel *network_name;
    UITextLabel *bssid;
}   
- (id) initWithNetwork: (NSDictionary *)network;
@end

@interface StumblerApplication : UIApplication {
    UIWindow *mainWindow;
    UIView *mainView;
    UITransitionView *transitionView;
		NSDictionary *currentNetwork;
    MSNetworkDetailsView *networkDetailsView;
    MSNetworksView *networksView;
}
+ (StumblerApplication *)sharedInstance;
- (void)applicationDidFinishLaunching:(id)unused;
- (NSDictionary *)currentNetwork;
- (void)currentNetwork:(NSDictionary *)network;
//- (void)applicationWillSuspend;
- (void)enableiPhonePreference;
- (void)showNetworkDetailsViewWithTransition:(int)trans;
- (void)showNetworksViewWithTransition:(int)trans;
@end