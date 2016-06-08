//
//  TapListTableViewController.h
//  TapList
//
//  Created by Brandon Manson on 6/7/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Beer.h"
#import "Wine.h"
#import "CreateBeerOrWineViewController.h"

@interface TapListTableViewController : UITableViewController <sendNewBeerOrWineToTapListDelegate>

@property(strong, nonatomic)NSMutableArray *beers;
@property(strong, nonatomic)NSMutableArray *wines;
@property(strong, nonatomic)NSMutableArray *pausedItems;

- (void)createBeersArray;
- (void)createWinesArray;
- (void)createArrays;
- (void)updateUIForOutOfStockItem;

@end
