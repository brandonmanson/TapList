//
//  Wine.h
//  TapList
//
//  Created by Brandon Manson on 6/7/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DrinkStatus.h"

@interface Wine : NSObject <DrinkStatus>

@property(strong, nonatomic)NSString *name;
@property(strong, nonatomic)NSString *winery;
@property(strong, nonatomic)NSString *style;
@property int numberOfBottlesLeft;

- (id)initWithWineName:(NSString *)wineName fromWinery:(NSString *)winery withStyle:(NSString *)style;
+ (id)initWithWineName:(NSString *)wineName fromWinery:(NSString *)winery withStyle:(NSString *)style;

@end
