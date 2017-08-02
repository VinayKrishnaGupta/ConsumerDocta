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
