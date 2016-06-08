//
//  TapListTableViewController.m
//  TapList
//
//  Created by Brandon Manson on 6/7/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "TapListTableViewController.h"
#import "BeerDetailViewController.h"
#import "WineDetailViewController.h"
#import "CreateBeerOrWineViewController.h"

@interface TapListTableViewController ()

@end

@implementation TapListTableViewController

- (void)viewDidLoad {
    [self createArrays];
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createBeersArray {
    Beer *twoHearted = [[Beer alloc]initWithBeerName:@"Two Hearted Ale" fromBrewery:@"Bell's Brewery" withStyle:@"IPA" withABV:7.0];
    Beer *detroitDwarf = [[Beer alloc]initWithBeerName:@"Detroit Dwarf" fromBrewery:@"Old Nation Brewing Company" withStyle:@"Dunkel" withABV:5.5];
    Beer *dirtyBastard = [[Beer alloc]initWithBeerName:@"Dirty Bastard" fromBrewery:@"Founders Brewing Company" withStyle:@"Scotch Ale" withABV:8.0];
    _beers = [NSMutableArray arrayWithObjects:twoHearted, detroitDwarf, dirtyBastard, nil];
}

- (void)createWinesArray {
    Wine *cabFranc = [[Wine alloc]initWithWineName:@"2013 Cabernet Franc" fromWinery:@"2 Lads" withStyle:@"Red"];
    Wine *vintnersSelect = [[Wine alloc]initWithWineName:@"2013 Vintner's Select Riesling" fromWinery:@"Sandhill Crane Vineyards" withStyle:@"White"];
    Wine *pinotGrigio = [[Wine alloc]initWithWineName:@"Pinot Grigio 2013" fromWinery:@"Leelanau Cellars" withStyle:@"White"];
    _wines = [NSMutableArray arrayWithObjects:cabFranc, vintnersSelect, pinotGrigio, nil];
}

- (void)createArrays {
    [self createBeersArray];
    [self createWinesArray];
}

- (void)updateUIForOutOfStockItem {
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return [_beers count];
    } else {
        return [_wines count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0) {
        return @"Beers";
    }
    else {
        return @"Wines";
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    // Configure the cell...
    if (indexPath.section == 0) {
        Beer *beerInCell = [_beers objectAtIndex:indexPath.row];
        cell.textLabel.text = beerInCell.name;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Stock: %d", beerInCell.numberOfKegsLeft];
    } else {
        Wine *wineInCell = [_wines objectAtIndex:indexPath.row];
        cell.textLabel.text = wineInCell.name;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Stock: %d", wineInCell.numberOfBottlesLeft];
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

#pragma mark - Editing

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [_beers removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/
#pragma mark - Delegate Methods

- (void)createAndAddBeerWithName:(NSString *)beerName fromBrewery:(NSString *)brewery ofStyle:(NSString *)style withABV:(float)abv {
    Beer *newBeer = [[Beer alloc]initWithBeerName:beerName fromBrewery:brewery withStyle:style withABV:abv];
    [_beers addObject:newBeer];
    Beer *lastBeerInArray = [_beers lastObject];
    NSLog(@"New beer delegate method called. Beer %@ added to array", lastBeerInArray.name);
    [self.tableView reloadData];
}

- (void)createAndAddWineWithName:(NSString *)wineName fromWinery:(NSString *)winery ofStyle:(NSString *)style {
    Wine *newWine = [[Wine alloc]initWithWineName:wineName fromWinery:winery withStyle:style];
    [_wines addObject:newWine];
    Wine *lastWineInArray = [_wines lastObject];
    NSLog(@"New wine delegate method called. Wine %@ added to array", lastWineInArray.name);
    [self.tableView reloadData];
}


#pragma mark - Navigation

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        [self performSegueWithIdentifier:@"beerDetailSegue" sender:indexPath];
    } else {
        [self performSegueWithIdentifier:@"wineDetailSegue" sender:indexPath];
    }
}

- (IBAction)unwindForBeerDetailSegue:(UIStoryboardSegue *)unwindSegue {
    BeerDetailViewController *vc = [unwindSegue sourceViewController];
    Beer *beerToUpdate = [_beers objectAtIndex:vc.pathForBeerToUpdate.row];
    beerToUpdate.numberOfKegsLeft = vc.beer.numberOfKegsLeft;
    [self.tableView reloadData];
}

- (IBAction)unwindForWineDetailSegue:(UIStoryboardSegue *)unwindSegue {
    WineDetailViewController *vc = [unwindSegue sourceViewController];
    Wine *wineToUpdate = [_wines objectAtIndex:vc.pathForWineToUpdate.row];
    wineToUpdate.numberOfBottlesLeft = vc.wine.numberOfBottlesLeft;
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = sender;
    if ([[segue identifier] isEqualToString:@"beerDetailSegue"]) {
        BeerDetailViewController *vc = [segue destinationViewController];
        Beer *beerToPass = [_beers objectAtIndex:indexPath.row];
        vc.beer = beerToPass;
        vc.pathForBeerToUpdate = indexPath;
    } else if ([[segue identifier] isEqualToString:@"wineDetailSegue"]){
        WineDetailViewController *vc = [segue destinationViewController];
        Wine *wineToPass = [_wines objectAtIndex:indexPath.row];
        vc.wine = wineToPass;
        vc.pathForWineToUpdate = indexPath;
    } else {
        CreateBeerOrWineViewController *vc = [segue destinationViewController];
        [vc setDelegate:self];
    }
}


@end
