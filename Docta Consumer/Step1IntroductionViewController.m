//
//  Step1IntroductionViewController.m
//  Docta Consumer
//
//  Created by RSTI E-Services on 15/07/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

#import "Step1IntroductionViewController.h"
#import "Docta_Consumer-Swift.h"


@interface Step1IntroductionViewController ()
- (IBAction)cancelButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *TitleLabelSpeciality;
@property (weak, nonatomic) IBOutlet UITextView *detailTextViewSpeciality;


@end

@implementation Step1IntroductionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    NSLog(@"Details of Speciality are %@ and %@",ReviewCasefileManager.sharedInstance.SpecialistyName,ReviewCasefileManager.sharedInstance.SelectedSpecialityDescription);
    
    self.TitleLabelSpeciality.text = ReviewCasefileManager.sharedInstance.SpecialistyName;
    self.detailTextViewSpeciality.text = ReviewCasefileManager.sharedInstance.SelectedSpecialityDescription;
    
}


-(void)dismissKeyboard
{
    [self.view endEditing:YES];
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

- (IBAction)cancelButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}
@end
