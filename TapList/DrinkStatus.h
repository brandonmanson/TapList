//
//  DrinkStatus.h
//  TapList
//
//  Created by Brandon Manson on 6/7/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DrinkStatus <NSObject>

- (void)runOut;
- (void)restock;

@end
