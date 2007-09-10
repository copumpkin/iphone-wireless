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
	void *libHandle;
	void *airportHandle;
	int (*open)(void *);
	int (*bind)(void *, NSString *);
	int (*close)(void *);
	int (*scan)(void *, NSArray **, void *);
}
- (id)initWithFrame:(struct CGRect)frame;
- (void)scan;

//Delegate Methods
- (void)navigationBar:(UINavigationBar*)bar buttonClicked:(int)button;
- (void)tableRowSelected:(NSNotification *)notification;

//DataSource Methods
- (int)numberOfRowsInTable:(UITable *)table;
- (UITableCell *)table:(UITable *)table cellForRow:(int)row column:(int)col;

@end