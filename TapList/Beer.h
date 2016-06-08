//
//  Beer.h
//  TapList
//
//  Created by Brandon Manson on 6/7/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DrinkStatus.h"

@interface Beer : NSObject <DrinkStatus>

@property(strong, nonatomic)NSString *name;
@property(strong, nonatomic)NSString *brewery;
@property(strong, nonatomic)NSString *style;
@property float abv;
@property int numberOfKegsLeft;

- (id)initWithBeerName:(NSString *)beerName fromBrewery:(NSString *)brewery withStyle:(NSString *)style withABV:(float)abv;
+ (id)initWithBeerName:(NSString *)beerName fromBrewery:(NSString *)brewery withStyle:(NSString *)style withABV:(float)abv;

@end
