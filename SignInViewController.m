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
#import "Step1YourcaseViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>

@interface SignInViewController ()
@property (weak, nonatomic) IBOutlet UIButton *ProceedButton;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_ProceedButton addTarget:self action:@selector(ProceedButtontoMainView) forControlEvents:UIControlEventTouchUpInside];
    UIImage *image = [UIImage imageNamed: @"DoctaLogo"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(10, 2, 100, 30);
    [self.navigationController.navigationBar addSubview:imageView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    // Do any additional setup after loading the view from its nib.
}

-(void)dismissKeyboard
{
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)ProceedButtontoMainView {
    [SVProgressHUD show];
    
  //  NSDictionary *loginCredentials = [NSDictionary dictionaryWithObjectsAndKeys:_emailTextField.text, @"email", _passwordTextField.text, @"password",  nil];
    NSDictionary *logincredentials = @{@"email": _emailTextField.text,@"password":_passwordTextField.text};
    
    
    
    
    [[APIHandler sharedInstance]GetDatafromAPI:@"POST" :@"login" :logincredentials  completionBlock:^(id dict, NSError *error)
  
     {
         
         NSLog(@"Response Dict in signin is %@  and Error is %@",dict,error );
         if ([dict isKindOfClass:[NSDictionary class]]) {
             NSString *token = [dict valueForKeyPath:@"data.token"];
             NSLog(@"You token is %@",token);
             [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"AccessToken"];
             [[NSUserDefaults standardUserDefaults]synchronize];
             
//             UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SubmitCase" bundle:nil];
//             MyCaseFilesViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"MyCaseFiles"];
//             [[self navigationController] pushViewController:vc animated:YES];
             
             [SVProgressHUD showSuccessWithStatus:@"Logged In Successfully"];
             [SVProgressHUD dismissWithDelay:1];
             [self dismissViewControllerAnimated:YES completion:nil];
             
             
             
             
             
//             UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"CreateNewCase" bundle:nil];
//             Step1YourcaseViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"step1yourcase"];
//             [[self navigationController] pushViewController:vc animated:YES];

             
             
            
             // [self presentViewController:vc animated:YES completion:nil];
         }
         else {
             [SVProgressHUD showSuccessWithStatus:@"Logged In Successfully"];
             [SVProgressHUD dismissWithDelay:1];
             [self dismissViewControllerAnimated:YES completion:nil];
             
//             UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Auth" bundle:nil];
//             Step1YourcaseViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"SignupVC"];
//             [[self navigationController] pushViewController:vc animated:YES];
             
             
             NSLog(@"Error is Login");
             
         }
         
     }];

    
    
}

- (IBAction)SignupButton:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
}




@end
