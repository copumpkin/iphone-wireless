#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h>
#import <UIKit/CDStructures.h>
#import <UIKit/UIHardware.h>
#import <UIKit/UIApplication.h>
#import <UIKit/UIKit.h>
#import <UIKit/UIView.h>

#import <UIKit/UIPreferencesTable.h>
#import <UIKit/UIPreferencesTableCell.h>
#import <UIKit/UIPreferencesTextTableCell.h>
#import <UIKit/UIPreferencesDeleteTableCell.h>
#import <UIKit/UINavigationBar.h>

#import "StumblerApplication.h"

@class StumblerApplication;

@interface MSNetworkDetailsView : UIView {
	UINavigationBar *navBar;
	UITable *table;
	NSDictionary *network;
	StumblerApplication *ms;
}

- (id)initWithFrame:(struct CGRect)frame;
- (void)reloadTableData;

//Delegate Methods
- (void)navigationBar:(UINavigationBar*)bar buttonClicked:(int)button;

//DataSource Methods
- (void)tableRowSelected:(NSNotification *)notification;
- (BOOL)table:(UITable*)table canSelectRow:(int)row;
//DataSource Methods
- (int)numberOfRowsInTable:(UITable *)table;
- (UITableCell *)table:(UITable *)table cellForRow:(int)row column:(int)col;

@end