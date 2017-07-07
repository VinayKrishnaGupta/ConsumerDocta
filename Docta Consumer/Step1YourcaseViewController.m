//
//  Step1YourcaseViewController.m
//  Docta Consumer
//
//  Created by RSTI E-Services on 07/07/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

#import "Step1YourcaseViewController.h"
#import <DLRadioButton/DLRadioButton.h>

@interface Step1YourcaseViewController ()
@property (weak, nonatomic) IBOutlet DLRadioButton *howlongradiobutton;

@end

@implementation Step1YourcaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_howlongradiobutton addTarget:self action:@selector(howlongradiobutton) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)logSelectedButton:(DLRadioButton *)radioButton {
    if (radioButton.isMultipleSelectionEnabled) {
        for (DLRadioButton *button in radioButton.selectedButtons) {
            NSLog(@"%@ is selected.\n", button.titleLabel.text);
        }
    } else {
        NSLog(@"%@ is selected.\n", radioButton.selectedButton.titleLabel.text);
    }
}


-(void)howlongradioButton {
    if (_howlongradiobutton.isMultipleSelectionEnabled) {
        for (DLRadioButton *button in _howlongradiobutton.selectedButtons) {
            NSLog(@"%@ is selected.\n", button.titleLabel.text);
        }
    } else {
        NSLog(@"%@ is selected.\n", _howlongradiobutton.selectedButton.titleLabel.text);
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
