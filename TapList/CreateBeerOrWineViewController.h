//
//  CreateBeerOrWineViewController.h
//  TapList
//
//  Created by Brandon Manson on 6/7/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Beer.h"
#import "Wine.h"

@protocol sendNewBeerOrWineToTapListDelegate <NSObject>

- (void)createAndAddBeerWithName:(NSString *)beerName fromBrewery:(NSString *)brewery ofStyle:(NSString *)style withABV:(float)abv;
- (void)createAndAddWineWithName:(NSString *)wineName fromWinery:(NSString *)winery ofStyle:(NSString *)style;

@end

@interface CreateBeerOrWineViewController : UIViewController

@property(weak, nonatomic) id<sendNewBeerOrWineToTapListDelegate>delegate;

- (float)normalizeABVInput:(NSString *)userABVInput;
- (BOOL)allInputValid;

@end
