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

//@property NSArray *players; // deprecated
@property int endScore;
@property int nTurn;

@end

@implementation GameViewController

- (void)viewDidLoad {
    NSLog(@"[%@ %@]", self.class, NSStringFromSelector(_cmd));

    [super viewDidLoad];
    

    // init game data
    self.nTurn = 0;
    self.endScore = 10000;

    // dice data objects
    self.dice = [NSMutableArray new];
    for (int i = 0; i < 6; i++) {
        Dice *d = [[Dice alloc] init];
        [self.dice addObject:d];
    }

    // dice UI views (buttons)
    self.diceViews =
    @[self.diceView1,
      self.diceView2,
      self.diceView3,
      self.diceView4,
      self.diceView5,
      self.diceView6
      ];

    // debug
    for (Player *p in self.players) {
        NSLog(@"received player %@ from parent VC", p.name);
    }

// deprecated: player list is now passed in from PlayerSelectVC
// players
//    self.players = @[
//        [[Player alloc] initWithName:@"Anne"],
//        [[Player alloc] initWithName:@"Bob"],
//        [[Player alloc] initWithName:@"Chris"],
//        [[Player alloc] initWithName:@"David"]
//    ];

}

// objectForView(): get Dice object corresponding to UIButton
- (Dice *)objectForView:(UIView *)diceView {
    NSLog(@"[%@ %@]", self.class, NSStringFromSelector(_cmd));
    for (int i = 0; i < self.diceViews.count; i++) {
        if (self.diceViews[i] == diceView) { return self.dice[i]; }
    }
    return nil;
}
// viewForObject(): get UIButton corresponding to Dice object
- (UIView *)viewForObject:(Dice *)diceData {
    NSLog(@"[%@ %@]", self.class, NSStringFromSelector(_cmd));
    for (int i = 0; i < self.dice.count; i++) {
        if (self.dice[i] == diceData) { return self.diceViews[i]; }
    }
    return nil;
}


// set all button images based on dice.value
- (void)setAllDiceFaces {
    NSLog(@"[%@ %@]", self.class, NSStringFromSelector(_cmd));
    
    for (int i = 0; i < self.dice.count; i++) {
        Dice *die = self.dice[i];
        UIButton *button = [self viewForObject:die];
        
        // use UIButton setImage:forState:
        NSString *faceImageName = [NSString stringWithFormat:@"dice%i", die.value];
        UIImage *faceImage = [UIImage imageNamed:faceImageName];
        [button setImage:faceImage forState:UIControlStateNormal];
    }
}


- (IBAction)onRollPressed:(UIButton *)sender {
    NSLog(@"[%@ %@]", self.class, NSStringFromSelector(_cmd));

    // roll all unlocked dice
    for (int i = 0; i < self.dice.count; i++) {
        Dice *die = self.dice[i];
        if (! die.isLocked) {
            NSLog(@"%@ unlocked", die);
            [die roll];
        } else {
            NSLog(@"%@ locked", die);
        }
    }
    
    // refresh UI
    [self setAllDiceFaces];
}

- (IBAction)onKeepPressed:(UIButton *)sender {
    NSLog(@"[%@ %@]", self.class, NSStringFromSelector(_cmd));
    
    // TODO
}

- (IBAction)onDicePressed:(UIButton *)button {
    NSLog(@"[%@ %@]", self.class, NSStringFromSelector(_cmd));

    // lock die
    Dice *dice = [self objectForView:button];
    dice.isLocked = !dice.isLocked;
    button.backgroundColor = (dice.isLocked) ? [UIColor redColor] : [UIColor clearColor];
}

@end
