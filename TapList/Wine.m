//
//  Wine.m
//  TapList
//
//  Created by Brandon Manson on 6/7/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "Wine.h"

@implementation Wine

- (id)initWithWineName:(NSString *)wineName fromWinery:(NSString *)winery withStyle:(NSString *)style {
    self = [super init];
    if (self) {
        _name = wineName;
        _winery = winery;
        _style = style;
        _numberOfBottlesLeft = 24;
    }
    return self;
}

+ (id)initWithWineName:(NSString *)wineName fromWinery:(NSString *)winery withStyle:(NSString *)style {
    return [[super alloc]initWithWineName:wineName fromWinery:winery withStyle:style];
}

- (void)runOut {
    _numberOfBottlesLeft = 0;
}

- (void)restock {
    _numberOfBottlesLeft = 24;
}

@end
