//
//  Dice.h
//  mm-farkle
//
//  Created by Christopher Serra on 3/24/16.
//  Copyright © 2016 plugh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dice : NSObject

@property int value;
@property BOOL isLocked;
-(void)roll;

@end
