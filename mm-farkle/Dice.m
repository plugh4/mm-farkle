//
//  Dice.m
//  mm-farkle
//
//  Created by Christopher Serra on 3/24/16.
//  Copyright © 2016 plugh. All rights reserved.
//

#import "Dice.h"


@implementation Dice

-(void)roll
{
    NSLog(@"[%@ %@]", self.class, NSStringFromSelector(_cmd));

    // generate random number 1-6
    int x = arc4random_uniform(6) + 1;
    self.value = x;
}

@end
