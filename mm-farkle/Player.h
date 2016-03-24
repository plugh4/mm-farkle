//
//  Player.h
//  mm-farkle
//
//  Created by Christopher Serra on 3/24/16.
//  Copyright © 2016 plugh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject
@property NSString *name;
@property int score;
-(instancetype)initWithName:(NSString *)name;
@end
