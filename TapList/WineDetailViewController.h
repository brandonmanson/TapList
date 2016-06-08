//
//  WineDetailViewController.h
//  TapList
//
//  Created by Brandon Manson on 6/7/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Wine.h"
#import "UpdateUserInterface.h"

@interface WineDetailViewController : UIViewController <UpdateUserInterface>

@property(strong, nonatomic)Wine *wine;
@property(strong, nonatomic)NSIndexPath *pathForWineToUpdate;


@end
