//
//  BeerDetailViewController.h
//  TapList
//
//  Created by Brandon Manson on 6/7/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Beer.h"
#import "UpdateUserInterface.h"

@interface BeerDetailViewController : UIViewController <UpdateUserInterface>

@property(strong, nonatomic)Beer *beer;
@property(strong, nonatomic)NSIndexPath *pathForBeerToUpdate;

@end
