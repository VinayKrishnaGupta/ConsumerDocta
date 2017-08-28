//
//  SignUpViewController.m
//  Docta Consumer
//
//  Created by RSTI E-Services on 09/06/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

#import "SignUpViewController.h"
#import "APIHandler.h"
#import "MyCaseFilesViewController.h"
@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UIButton *proceedButton;
@property (weak, nonatomic) IBOutlet UIButton *SignINButton;
@property (weak, nonatomic) IBOutlet UITextField *firstName;

@property (weak, nonatomic) IBOutlet UITextField *emailtextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordtextfield;

@property (weak, nonatomic) IBOutlet UIButton *refererbutton;
@property (weak, nonatomic) IBOutlet UIButton *carerButton;
@property (weak, nonatomic) IBOutlet UIButton *patientButton;

@property (weak, nonatomic) IBOutlet UIButton *maleButton;
@property (weak, nonatomic) IBOutlet UIButton *femaleButton;
@property (weak, nonatomic) IBOutlet UIButton *otherButton;
- (IBAction)backButton:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITextField *patientNametextField;
@property (weak, nonatomic) IBOutlet UITextField *patientAgeTextfield;
@property (weak, nonatomic) IBOutlet UITextField *NationalityTextfield;
@property (weak,nonatomic) NSString *SelectedUserType;






@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_refererbutton addTarget:self action:@selector(changeButtonStates) forControlEvents:UIControlEventTouchUpInside];
    [_carerButton addTarget:self action:@selector(changeButtonStates) forControlEvents:UIControlEventTouchUpInside];
    [_patientButton addTarget:self action:@selector(changeButtonStates) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_maleButton addTarget:self action:@selector(SelectGenderButton) forControlEvents:UIControlEventTouchUpInside];
    [_femaleButton addTarget:self action:@selector(SelectGenderButton) forControlEvents:UIControlEventTouchUpInside];
    [_otherButton addTarget:self action:@selector(SelectGenderButton) forControlEvents:UIControlEventTouchUpInside];
   //Default Colours for Buttons
    _patientButton.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:206.0f/255.0f blue:74.0f/255.0f alpha:1];
    [_patientButton setTitleColor:[UIColor colorWithRed:255.0f/255.0f green:98.0f/255.0f blue:2.0f/255.0f alpha:1] forState:UIControlStateNormal];
    _SelectedUserType = _patientButton.titleLabel.text;
    
    _maleButton.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:206.0f/255.0f blue:74.0f/255.0f alpha:1];
    [_maleButton setTitleColor:[UIColor colorWithRed:255.0f/255.0f green:98.0f/255.0f blue:2.0f/255.0f alpha:1] forState:UIControlStateNormal];
    
   
   

  //  [[APIHandler sharedInstance] GetDatafromAPI:@"POST" :loginCredentials];
 //   NSLog(@"Response is %@",  [[APIHandler sharedInstance] GetDatafromAPI:@"POST" :loginCredentials]);
    
    
   // [APIHandler PostCallAPI:loginCredentials completionBlock:^(id dict, NSError *error){
        
  //  NSLog(@"Response Dict in signup is %@  and Error is %@",dict,error );
   // }];
    
    
    
    [_proceedButton addTarget:self action:@selector(ProceedButton) forControlEvents:UIControlEventTouchUpInside];
    [_SignINButton addTarget:self action:@selector(SigninButton) forControlEvents:UIControlEventTouchUpInside];
   
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    self.navigationItem.hidesBackButton = YES;
    _firstName.delegate = self;
    _patientNametextField.delegate = self;
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void)dismissKeyboard
{
    [self.view endEditing:YES];
}



-(void)ProceedButton {
//    
//    NSDictionary *parameters = @{@"email":_emailtextfield.text, @"password":_passwordTextField.text,@"first_name":_firstName.text, @"last_name":_LastName.text};
//    
//    [[APIHandler sharedInstance]GetDatafromAPI:@"POST" :@"register" :parameters  completionBlock:^(id dict, NSError *error)
//     
//     {
//         
//         NSLog(@"Response Dict in signin is %@  and Error is %@",dict,error );
//         if ([dict isKindOfClass:[NSDictionary class]]) {
//             [self LogininBackground];
//         }
//         else {
//             NSLog(@"Error is signup");
//             
//         }
//         
//     }];
//
//    
    
    
}

- (void)LogininBackground {
    NSDictionary *logincredentials = @{@"email": _emailtextfield.text,@"password":_passwordTextField.text};
    
    
    
    
    [[APIHandler sharedInstance]GetDatafromAPI:@"POST" :@"login" :logincredentials  completionBlock:^(id dict, NSError *error)
     
     {
         
         NSLog(@"Response Dict in signin is %@  and Error is %@",dict,error );
         if ([dict isKindOfClass:[NSDictionary class]]) {
             NSString *token = [dict valueForKeyPath:@"data.token"];
             NSLog(@"You token is %@",token);
             [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"AccessToken"];
             [[NSUserDefaults standardUserDefaults]synchronize];
             
             UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SubmitCase" bundle:nil];
             MyCaseFilesViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"MyCaseFiles"];
             [[self navigationController] pushViewController:vc animated:YES];
             // [self presentViewController:vc animated:YES completion:nil];
         }
         else {
             NSLog(@"Error is Login");
             
         }
         
     }];
    
    

    
    
    
}


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self view] endEditing:YES];
}


-(void)SigninButton {
    [self performSegueWithIdentifier:@"signInVC" sender:nil];
}


-(void)changeButtonStates {
    if (_refererbutton.touchInside) {
        _SelectedUserType = _refererbutton.titleLabel.text;
        _refererbutton.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:206.0f/255.0f blue:74.0f/255.0f alpha:1];
        [_refererbutton setTitleColor:[UIColor colorWithRed:255.0f/255.0f green:98.0f/255.0f blue:2.0f/255.0f alpha:1] forState:UIControlStateNormal];
        _carerButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_carerButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _patientButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_patientButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
    }
    else if (_carerButton.touchInside) {
        _SelectedUserType = _carerButton.titleLabel.text;
        _carerButton.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:206.0f/255.0f blue:74.0f/255.0f alpha:1];
        [_carerButton setTitleColor:[UIColor colorWithRed:255.0f/255.0f green:98.0f/255.0f blue:2.0f/255.0f alpha:1] forState:UIControlStateNormal];
        _refererbutton.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_refererbutton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _patientButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_patientButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
    }
    else if (_patientButton.touchInside) {
        
        _SelectedUserType = _patientButton.titleLabel.text;
        _patientButton.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:206.0f/255.0f blue:74.0f/255.0f alpha:1];
        [_patientButton setTitleColor:[UIColor colorWithRed:255.0f/255.0f green:98.0f/255.0f blue:2.0f/255.0f alpha:1] forState:UIControlStateNormal];
        _carerButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_carerButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _refererbutton.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_refererbutton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
    }
    
    
    
    
    
}


-(void)SelectGenderButton {
    if (_maleButton.touchInside) {
        _maleButton.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:206.0f/255.0f blue:74.0f/255.0f alpha:1];
        [_maleButton setTitleColor:[UIColor colorWithRed:255.0f/255.0f green:98.0f/255.0f blue:2.0f/255.0f alpha:1] forState:UIControlStateNormal];
        _femaleButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_femaleButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _otherButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_otherButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
    }
    else if (_femaleButton.touchInside) {
        _femaleButton.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:206.0f/255.0f blue:74.0f/255.0f alpha:1];
        [_femaleButton setTitleColor:[UIColor colorWithRed:255.0f/255.0f green:98.0f/255.0f blue:2.0f/255.0f alpha:1] forState:UIControlStateNormal];
        _maleButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_maleButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _otherButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_otherButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
    }
    else if (_otherButton.touchInside) {
        _otherButton.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:206.0f/255.0f blue:74.0f/255.0f alpha:1];
        [_otherButton setTitleColor:[UIColor colorWithRed:255.0f/255.0f green:98.0f/255.0f blue:2.0f/255.0f alpha:1] forState:UIControlStateNormal];
        _femaleButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_femaleButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _maleButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_maleButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
    }
    
    
    
    
    
    
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (textField == _firstName) {
        if ([_SelectedUserType isEqualToString:@"PATIENT"]) {
            _patientNametextField.text = _firstName.text;
        }
        
        
    }
    return YES;
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
@end
