//
//  CreateBeerOrWineViewController.m
//  TapList
//
//  Created by Brandon Manson on 6/7/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "CreateBeerOrWineViewController.h"

@interface CreateBeerOrWineViewController ()
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControlForDrinkType;
@property (strong, nonatomic) IBOutlet UITextField *drinkNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *styleTextField;
@property (strong, nonatomic) IBOutlet UITextField *drinkProducerTextField;
@property (strong, nonatomic) IBOutlet UITextField *abvTextField;
@property (strong, nonatomic) IBOutlet UIButton *addDrinkButton;

@end

@implementation CreateBeerOrWineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_segmentedControlForDrinkType setSelectedSegmentIndex:0];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)allInputValid {
    if (_segmentedControlForDrinkType.selectedSegmentIndex == 0) {
        return (_drinkNameTextField.text != nil && _styleTextField.text != nil && _drinkProducerTextField.text != nil && _abvTextField != nil);
    } else {
        return (_drinkNameTextField.text != nil && _styleTextField.text != nil && _drinkProducerTextField.text != nil);
    }
}

- (float)normalizeABVInput:(NSString *)userABVInput {
    return [userABVInput floatValue];
}

- (IBAction)segmentedControlPressed:(UISegmentedControl *)sender {
    if (_segmentedControlForDrinkType.selectedSegmentIndex == 0) {
        _abvTextField.alpha = 1.0;
        _abvTextField.enabled = YES;
    } else {
        _abvTextField.alpha = 0.0;
        _abvTextField.enabled = NO;
    }
}
- (IBAction)addNewDrinkButtonPressed:(UIButton *)sender {
    if ([self allInputValid]) {
        if (_segmentedControlForDrinkType.selectedSegmentIndex == 0) {
            [self.delegate createAndAddBeerWithName:_drinkNameTextField.text fromBrewery:_drinkProducerTextField.text ofStyle:_styleTextField.text withABV:[self normalizeABVInput:_abvTextField.text]];
            _addDrinkButton.enabled = NO;
            _addDrinkButton.alpha = 0.2;
        } else {
            [self.delegate createAndAddWineWithName:_drinkNameTextField.text fromWinery:_drinkProducerTextField.text ofStyle:_styleTextField.text];
            _addDrinkButton.enabled = NO;
            _addDrinkButton.alpha = 0.2;
        }
    }
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
