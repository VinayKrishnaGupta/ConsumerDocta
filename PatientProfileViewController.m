//
//  PatientProfileViewController.m
//  Docta Consumer
//
//  Created by RSTI E-Services on 18/09/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

#import "PatientProfileViewController.h"
#import "Docta_Consumer-Swift.h"

@interface PatientProfileViewController ()
@property (weak, nonatomic) IBOutlet UIButton *maleButton;
@property (weak, nonatomic) IBOutlet UIButton *femaleButton;
@property (weak, nonatomic) IBOutlet UIButton *otherButton;


@property (weak, nonatomic) NSString *Gender;
@property (weak, nonatomic) IBOutlet UITextField *patientNametextField;
@property (weak, nonatomic) IBOutlet UITextField *patientAgeTextfield;
@property (weak, nonatomic) IBOutlet UITextField *NationalityTextfield;
- (IBAction)backButton:(UIButton *)sender;
- (IBAction)proceedButton:(UIButton *)sender;


@end

@implementation PatientProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_maleButton addTarget:self action:@selector(SelectGenderButton) forControlEvents:UIControlEventTouchUpInside];
    [_femaleButton addTarget:self action:@selector(SelectGenderButton) forControlEvents:UIControlEventTouchUpInside];
    [_otherButton addTarget:self action:@selector(SelectGenderButton) forControlEvents:UIControlEventTouchUpInside];
    _maleButton.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:206.0f/255.0f blue:74.0f/255.0f alpha:1];
    [_maleButton setTitleColor:[UIColor colorWithRed:255.0f/255.0f green:98.0f/255.0f blue:2.0f/255.0f alpha:1] forState:UIControlStateNormal];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)SelectGenderButton {
    if (_maleButton.touchInside) {
        self.Gender = @"male";
        _maleButton.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:206.0f/255.0f blue:74.0f/255.0f alpha:1];
        [_maleButton setTitleColor:[UIColor colorWithRed:255.0f/255.0f green:98.0f/255.0f blue:2.0f/255.0f alpha:1] forState:UIControlStateNormal];
        _femaleButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_femaleButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _otherButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_otherButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
    }
    else if (_femaleButton.touchInside) {
        self.Gender = @"female";
        _femaleButton.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:206.0f/255.0f blue:74.0f/255.0f alpha:1];
        [_femaleButton setTitleColor:[UIColor colorWithRed:255.0f/255.0f green:98.0f/255.0f blue:2.0f/255.0f alpha:1] forState:UIControlStateNormal];
        _maleButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_maleButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _otherButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_otherButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
    }
    else if (_otherButton.touchInside) {
        self.Gender = @"other";
        _otherButton.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:206.0f/255.0f blue:74.0f/255.0f alpha:1];
        [_otherButton setTitleColor:[UIColor colorWithRed:255.0f/255.0f green:98.0f/255.0f blue:2.0f/255.0f alpha:1] forState:UIControlStateNormal];
        _femaleButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_femaleButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _maleButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_maleButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
    }
    
    
    
    
    
    
}




-(void)ProceedButton {
    
    
    ReviewCasefileManager.sharedInstance.S48PatientGender = self.Gender;
    ReviewCasefileManager.sharedInstance.S49PatientName = self.patientNametextField.text;
    ReviewCasefileManager.sharedInstance.S50PatientAge = [self.patientAgeTextfield.text integerValue];
    ReviewCasefileManager.sharedInstance.S51PatientNationality = self.NationalityTextfield.text;
    
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ReviewCase" bundle:nil];
    ReviewCaseFileViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ReviewCaseVC"];
    [[self navigationController] pushViewController:vc animated:YES];
    
    
    //        let storyboard1 = UIStoryboard(name: "ReviewCase", bundle: nil)
    //        let controller1 = storyboard1.instantiateViewController(withIdentifier: "ReviewCaseVC")
    //        self.navigationController?.pushViewController(controller1, animated: false)
    
    
    
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)proceedButton:(UIButton *)sender {
    [self performSegueWithIdentifier:@"SignupVC" sender:self];
    
    
    
}
@end
