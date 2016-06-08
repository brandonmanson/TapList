//
//  BeerDetailViewController.m
//  TapList
//
//  Created by Brandon Manson on 6/7/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "BeerDetailViewController.h"

@interface BeerDetailViewController ()
@property (strong, nonatomic) IBOutlet UILabel *beerNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *breweryNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *stockRemainingLabel;
@property (strong, nonatomic) IBOutlet UILabel *abvLabel;
@property (strong, nonatomic) IBOutlet UIStepper *stepperForChangingStock;

@end

@implementation BeerDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateUI {
    _beerNameLabel.text = _beer.name;
    _breweryNameLabel.text = _beer.brewery;
    _stepperForChangingStock.value = _beer.numberOfKegsLeft;
    _stepperForChangingStock.minimumValue = 0;
    _stepperForChangingStock.maximumValue = 3;
    _abvLabel.text = [NSString stringWithFormat:@"ABV: %g", _beer.abv];
    [self updateAmountLeftLabel];
}

- (void)updateAmountLeftLabel {
    _stockRemainingLabel.text = [NSString stringWithFormat:@"Amount remaining: %d", _beer.numberOfKegsLeft];
}
- (IBAction)stepperValueChanged:(UIStepper *)sender {
    _beer.numberOfKegsLeft = sender.value;
    [self updateAmountLeftLabel];
}

- (IBAction)outOfStockButtonPressed:(UIButton *)sender {
    [_beer runOut];
    [self updateAmountLeftLabel];
    NSLog(@"runOut called. Stock is %d", _beer.numberOfKegsLeft);
}

- (IBAction)replenishStockButtonPressed:(UIButton *)sender {
    [_beer restock];
    [self updateAmountLeftLabel];
    NSLog(@"restock called. Stock is %d", _beer.numberOfKegsLeft);
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
