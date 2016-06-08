//
//  Beer.m
//  TapList
//
//  Created by Brandon Manson on 6/7/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "Beer.h"

@implementation Beer

- (id)initWithBeerName:(NSString *)beerName fromBrewery:(NSString *)brewery withStyle:(NSString *)style withABV:(float)abv {
    self = [super init];
    if (self) {
        _name = beerName;
        _brewery = brewery;
        _style = style;
        _abv = abv;
        _numberOfKegsLeft = 3;
    }
    return self;
}

+ (id)initWithBeerName:(NSString *)beerName fromBrewery:(NSString *)brewery withStyle:(NSString *)style withABV:(float)abv {
    return [[super alloc]initWithBeerName:beerName fromBrewery:brewery withStyle:style withABV:abv];
}

- (void)runOut {
    _numberOfKegsLeft = 0;
}

- (void)restock {
    _numberOfKegsLeft = 3;
}

@end
