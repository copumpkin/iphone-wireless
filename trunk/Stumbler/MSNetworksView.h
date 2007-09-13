#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h>
#import <UIKit/CDStructures.h>
#import <UIKit/UIHardware.h>
#import <UIKit/UIApplication.h>
#import <UIKit/UIKit.h>
#import <UIKit/UIView.h>
#import <UIKit/UITable.h>
#import <UIKit/UITableColumn.h>
#import <UIKit/UITableCell.h>
#import <UIKit/UINavigationBar.h>

#import "StumblerApplication.h"

@class StumblerApplication;
@class StumblerTableCell;

@interface MSNetworksView : UIView {
	UINavigationBar *navBar;
	UISectionTable *stable;
	StumblerApplication *ms;
	NSMutableArray *openNetworks;
	NSMutableArray *protectedNetworks;
	UINavigationItem *title;
	UISectionList *sectionList;
}
- (id)initWithFrame:(struct CGRect)frame;

//Delegate Methods
- (void)navigationBar:(UINavigationBar*)bar buttonClicked:(int)button;
- (void)tableRowSelected:(NSNotification *)notification;

//DataSource Methods
- (NSDictionary *) itemForIndex: (int)index;
- (int)numberOfRowsInTable:(UITable *)table;
- (UITableCell *)table:(UITable *)table cellForRow:(int)row column:(int)col;

@end