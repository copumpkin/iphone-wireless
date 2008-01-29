/*******************************************************************************
 * iPhone-Wireless Project : Stumbler                                          *
 * Copyright (C) 2007-2008 Pumpkin <pumpkingod@gmail.com>                      *
 * Copyright (C) 2007-2008 Lokkju <lokkju@gmail.com>                           *
 *******************************************************************************
 * $LastChangedDate::                                                        $ *
 * $LastChangedBy::                                                          $ *
 * $LastChangedRevision::                                                    $ *
 * $Id::                                                                     $ *
 *******************************************************************************
 *  This program is free software: you can redistribute it and/or modify       *
 *  it under the terms of the GNU General Public License as published by       *
 *  the Free Software Foundation, either version 3 of the License, or          *
 *  (at your option) any later version.                                        *
 *                                                                             *
 *  This program is distributed in the hope that it will be useful,            *
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of             *
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              *
 *  GNU General Public License for more details.                               *
 *                                                                             *
 *  You should have received a copy of the GNU General Public License          *
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.      *
 *******************************************************************************/

/* $HeadURL$ */
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
#import <UIKit/UIProgressIndicator.h>

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
	UIProgressIndicator   *progressIndicator;
	UIPushButton *scanButton;
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