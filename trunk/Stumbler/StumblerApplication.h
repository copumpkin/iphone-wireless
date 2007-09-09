#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h>
#import <UIKit/CDStructures.h>
#import <UIKit/UIPushButton.h>
#import <UIKit/UIThreePartButton.h>
#import <UIKit/UIWindow.h>
#import <UIKit/UIView-Hierarchy.h>
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

@interface StumblerTableCell : UITableCell {
    UITextLabel *network_name;
    UITextLabel *bssid;
}   

@end

@interface StumblerApplication : UIApplication {
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

@end