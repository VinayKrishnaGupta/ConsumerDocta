//
//  SignInViewController.m
//  Docta Consumer
//
//  Created by RSTI E-Services on 09/06/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

#import "SignInViewController.h"
#import "MyCaseFilesViewController.h"
#import "APIHandler.h"

@interface SignInViewController ()
@property (weak, nonatomic) IBOutlet UIButton *ProceedButton;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_ProceedButton addTarget:self action:@selector(ProceedButtontoMainView) forControlEvents:UIControlEventTouchUpInside];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)ProceedButtontoMainView {
    
    NSDictionary *loginCredentials = [NSDictionary dictionaryWithObjectsAndKeys:_emailTextField.text, @"email", _passwordTextField.text, @"password",  nil];
    
    [[APIHandler sharedInstance]GetDatafromAPI:@"POST" :@"user/login" :loginCredentials  completionBlock:^(id dict, NSError *error)
  
     {
         
         NSLog(@"Response Dict in signup is %@  and Error is %@",dict,error );
         if ([dict isKindOfClass:[NSDictionary class]]) {
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

- (IBAction)SignupButton:(UIButton *)sender {
    [self performSegueWithIdentifier:@"signupVC" sender:self];
    
    
    
}




@end
