//
//  Player.m
//  mm-farkle
//
//  Created by Christopher Serra on 3/24/16.
//  Copyright © 2016 plugh. All rights reserved.
//

#import "Player.h"

@implementation Player

-(instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        self.name = name;
        self.score = 0;
    }
    return self;
}

@end
