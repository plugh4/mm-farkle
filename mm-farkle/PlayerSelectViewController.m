//
//  PlayerSelectViewController.m
//  mm-farkle
//
//  Created by Christopher Serra on 3/27/16.
//  Copyright © 2016 plugh. All rights reserved.
//

#import "PlayerSelectViewController.h"
#import "GameViewController.h"
#import "Player.h"

@interface PlayerSelectViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSMutableArray *playersArray;

@end


@implementation PlayerSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"[%@ %@]", self.class, NSStringFromSelector(_cmd));

    // players
    //self.playersArray = [NSMutableArray new];
    self.playersArray =
        [@[
         [[Player alloc] initWithName:@"Anne"],
         [[Player alloc] initWithName:@"Bob"],
         [[Player alloc] initWithName:@"Chris"],
         [[Player alloc] initWithName:@"David"]
         ] mutableCopy];

}


#pragma mark - UITableViewDataSource
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"[%@ %@]", self.class, NSStringFromSelector(_cmd));
    return self.playersArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"[%@ %@]", self.class, NSStringFromSelector(_cmd));

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playerSelectCell"];
    int i = indexPath.row;

    Player *p = self.playersArray[i];
    cell.textLabel.text = p.name;
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"Record: %i-%i", p.numWins, p.numLosses];
    
    // manually set background color for selected cells
//    UIView *bgColorView = [[UIView alloc] init];
//    bgColorView.backgroundColor = [UIColor redColor];
//    bgColorView.layer.cornerRadius = 20;
//    [cell setSelectedBackgroundView:bgColorView];

    return cell;
}

#pragma mark - UITableViewDelegate - Selection
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"[%@ %@]", self.class, NSStringFromSelector(_cmd));
    
    GameViewController *dstVC = [segue destinationViewController];
    
    // find selected players
    NSArray *selectedPaths = [self.tableView indexPathsForSelectedRows];
    NSMutableArray *playersInGame = [NSMutableArray new];
    for (NSIndexPath *indexPath in selectedPaths) {
        int i = indexPath.row;
        [playersInGame addObject:self.playersArray[i]];
    }
    dstVC.players = playersInGame;
}

@end
