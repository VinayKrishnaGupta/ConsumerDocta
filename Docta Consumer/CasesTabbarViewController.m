//
//  CasesTabbarViewController.m
//  DoctaPartner
//
//  Created by RSTI E-Services on 05/07/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

#import "CasesTabbarViewController.h"

@interface CasesTabbarViewController ()

@end

@implementation CasesTabbarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton = YES;
    self.delegate = self;
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor lightGrayColor], NSForegroundColorAttributeName,
                                                       [UIFont fontWithName:@"Helvetica" size:16],
                                                       NSFontAttributeName,
                                                       nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                            [UIColor whiteColor], NSForegroundColorAttributeName,
                                            [UIFont fontWithName:@"Helvetica" size:18], NSFontAttributeName,
                                            nil] forState:UIControlStateSelected];
    
    
    [[UITabBarItem appearance] setBadgeColor:[UIColor darkGrayColor]];
    
    
//    let button = UIButton.init(type: .custom)
//    button.setTitle("Create Case File", for: .normal)
//    button.titleLabel?.font = UIFont(name: "Rubik", size: 15)
//    button.layer.cornerRadius = 15
//    button.backgroundColor = UIColor(red:0.08, green:0.65, blue:1, alpha:1)
//    button.setTitleColor(UIColor.white, for: .normal)
//    button.frame = CGRect(x: 0, y: 0, width: 150, height: 45)
//    button.addTarget(self, action: #selector(goToCreateCaseFile), for: .touchUpInside)
//    let barButton = UIBarButtonItem(customView: button)
//    self.navigationItem.rightBarButtonItem = barButton
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 120, 40)];
    [button setTitle:@"Create Casefile" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor colorWithRed:0.08 green:0.65 blue:1 alpha:1];
    button.layer.cornerRadius = 15;
    button.titleLabel.font = [UIFont fontWithName:@"Rubik" size:15];
    [button addTarget:self action:@selector(GotoCreateCaseFile) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *RightButton = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = RightButton;
    


    
}
-(void)GotoCreateCaseFile {
    NSLog(@"Create Case file button clicked");
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
}


- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self.tabBar invalidateIntrinsicContentSize];
    
    CGFloat tabSize = 44.0;
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    if (UIInterfaceOrientationIsLandscape(orientation))
    {
        tabSize = 32.0;
    }
    
    CGRect tabFrame = self.tabBar.frame;
    
    tabFrame.size.height = tabSize;
    
    tabFrame.origin.y = self.view.frame.origin.y + self.navigationController.navigationBar.frame.size.height + 20;
    
    self.tabBar.frame = tabFrame;
    
    // Set the translucent property to NO then back to YES to
    // force the UITabBar to reblur, otherwise part of the
    // new frame will be completely transparent if we rotate
    // from a landscape orientation to a portrait orientation.
    
//    self.tabBar.translucent = NO;
//    self.tabBar.translucent = YES;
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
