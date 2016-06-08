//
//  WineDetailViewController.m
//  TapList
//
//  Created by Brandon Manson on 6/7/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "WineDetailViewController.h"

@interface WineDetailViewController ()
@property (strong, nonatomic) IBOutlet UILabel *wineNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *wineryNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *amountLeftLabel;
@property (strong, nonatomic) IBOutlet UIStepper *stepperForChangingStock;


@end

@implementation WineDetailViewController

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
    _wineNameLabel.text = _wine.name;
    _wineryNameLabel.text = _wine.winery;
    _stepperForChangingStock.value = _wine.numberOfBottlesLeft;
    _stepperForChangingStock.minimumValue = 0;
    _stepperForChangingStock.maximumValue = 24;
    [self updateAmountLeftLabel];
}

- (void)updateAmountLeftLabel {
    _amountLeftLabel.text = [NSString stringWithFormat:@"%d", _wine.numberOfBottlesLeft];
}
- (IBAction)stepperPressed:(UIStepper *)sender {
    _wine.numberOfBottlesLeft = sender.value;
    [self updateAmountLeftLabel];
}


- (IBAction)outOfStockButtonPressed:(UIButton *)sender {
    [_wine runOut];
    [self updateAmountLeftLabel];
    NSLog(@"runOut called. Stock is %d", _wine.numberOfBottlesLeft);
}

- (IBAction)replenishStockButtonPressed:(UIButton *)sender {
    [_wine restock];
    [self updateAmountLeftLabel];
    NSLog(@"restock called. Stock is %d", _wine.numberOfBottlesLeft);
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
