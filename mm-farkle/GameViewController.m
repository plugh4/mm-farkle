//
//  GameViewController.m
//  mm-farkle
//
//  Created by Christopher Serra on 3/24/16.
//  Copyright © 2016 plugh. All rights reserved.
//

#import "GameViewController.h"
#import "Dice.h"
#import "Player.h"

@interface GameViewController ()

// UI
@property NSArray *diceViews;
@property (weak, nonatomic) IBOutlet UIButton *diceView1;
@property (weak, nonatomic) IBOutlet UIButton *diceView2;
@property (weak, nonatomic) IBOutlet UIButton *diceView3;
@property (weak, nonatomic) IBOutlet UIButton *diceView4;
@property (weak, nonatomic) IBOutlet UIButton *diceView5;
@property (weak, nonatomic) IBOutlet UIButton *diceView6;


// data
@property NSMutableArray *dice;
@property NSArray *players;
@property int endScore;
@property int nTurn;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UI
    self.diceViews = @[
        self.diceView1,
        self.diceView2,
        self.diceView3,
        self.diceView4,
        self.diceView5,
        self.diceView6
    ];

    // players
    self.players = @[
        [[Player alloc] initWithName:@"Anne"],
        [[Player alloc] initWithName:@"Bob"],
        [[Player alloc] initWithName:@"Chris"],
        [[Player alloc] initWithName:@"David"]
    ];
    self.nTurn = 0;
    
//    self.dice = @[
//        [[Dice alloc] init],
//        [[Dice alloc] init],
//        [[Dice alloc] init],
//        [[Dice alloc] init],
//        [[Dice alloc] init],
//        [[Dice alloc] init]
//    ];
    self.dice = [NSMutableArray new];
    for (int i = 0; i < 6; i++) {
        Dice *d = [[Dice alloc] init];
        [self.dice addObject:d];
    }

    // gameplay
    self.endScore = 10000;
}
- (IBAction)onRollPressed:(UIButton *)sender
{
    NSLog(@"%@", NSStringFromSelector(_cmd));

    // roll all unlocked dice
    NSLog(@"array of %i", self.dice.count);
    for (int i = 0; i < self.dice.count; i++) {
        Dice *die = self.dice[i];
//    for (Dice *die in self.dice) {
        if (! die.isLocked) {
            NSLog(@"%@ unlocked", die);
            [die roll];
        } else {
            NSLog(@"%@ locked", die);
        }
    }
    
    // refresh UI
    for (int i = 0; i < self.dice.count; i++) {
        Dice *die = self.dice[i];
        UIButton *button = self.diceViews[i];
        NSString *text = [NSString stringWithFormat:@"%i", die.value];
        [button setTitle:text forState:UIControlStateNormal];
    }
}
- (IBAction)onKeepPressed:(UIButton *)sender
{
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
