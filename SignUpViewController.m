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
@property (weak, nonatomic) IBOutlet UITextField *LastName;
@property (weak, nonatomic) IBOutlet UITextField *emailtextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    

  //  [[APIHandler sharedInstance] GetDatafromAPI:@"POST" :loginCredentials];
 //   NSLog(@"Response is %@",  [[APIHandler sharedInstance] GetDatafromAPI:@"POST" :loginCredentials]);
    
    
   // [APIHandler PostCallAPI:loginCredentials completionBlock:^(id dict, NSError *error){
        
  //  NSLog(@"Response Dict in signup is %@  and Error is %@",dict,error );
   // }];
    
    
    
    [_proceedButton addTarget:self action:@selector(ProceedButton) forControlEvents:UIControlEventTouchUpInside];
   
    
    // Do any additional setup after loading the view.
}





-(void)ProceedButton {
    
    NSDictionary *parameters = @{@"email":_emailtextfield.text, @"password":_passwordTextField.text,@"first_name":_firstName.text, @"last_name":_LastName.text};
    
    [[APIHandler sharedInstance]GetDatafromAPI:@"POST" :@"register" :parameters  completionBlock:^(id dict, NSError *error)
     
     {
         
         NSLog(@"Response Dict in signin is %@  and Error is %@",dict,error );
         if ([dict isKindOfClass:[NSDictionary class]]) {
             [self LogininBackground];
         }
         else {
             NSLog(@"Error is signup");
             
         }
         
     }];

    
    
    
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
