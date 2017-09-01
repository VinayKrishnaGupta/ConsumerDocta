//
//  Step4IntroViewController.m
//  Docta Consumer
//
//  Created by RSTI E-Services on 01/09/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

#import "Step4IntroViewController.h"

@interface Step4IntroViewController ()
- (IBAction)closeButton:(UIButton *)sender;

@end

@implementation Step4IntroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)closeButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
    
}
@end
