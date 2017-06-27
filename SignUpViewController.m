//
//  SignUpViewController.m
//  Docta Consumer
//
//  Created by RSTI E-Services on 09/06/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

#import "SignUpViewController.h"
#import "APIHandler.h"

@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UIButton *proceedButton;
@property (weak, nonatomic) IBOutlet UIButton *SignINButton;

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
