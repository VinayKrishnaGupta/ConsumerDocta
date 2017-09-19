//
//  SpecialitsTabBarViewController.m
//  Docta Consumer
//
//  Created by RSTI E-Services on 11/09/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

#import "SpecialitsTabBarViewController.h"

@interface SpecialitsTabBarViewController ()

@end

@implementation SpecialitsTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    self.navigationItem.hidesBackButton = YES;
    self.delegate = self;
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor whiteColor], NSForegroundColorAttributeName,
                                                       [UIFont fontWithName:@"Helvetica" size:18],
                                                       NSFontAttributeName,
                                                       nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor whiteColor], NSForegroundColorAttributeName,
                                                       [UIFont fontWithName:@"Helvetica" size:18], NSFontAttributeName,
                                                       nil] forState:UIControlStateSelected];
    
    
    [[UITabBarItem appearance] setBadgeColor:[UIColor darkGrayColor]];
   
    UIImage *whiteBackground = [[UIImage imageNamed:@"bluebackgroud"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) ];
    [[UITabBar appearance] setClipsToBounds:YES];
    [[UITabBar appearance] setSelectionIndicatorImage:whiteBackground];
    [[UITabBar appearance] setItemWidth:self.view.frame.size.width/2];
    [[UITabBar appearance] setItemPositioning:UITabBarItemPositioningAutomatic];

    
    
    
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self.tabBar invalidateIntrinsicContentSize];
    
    CGFloat tabSize = 50.0;
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    if (UIInterfaceOrientationIsLandscape(orientation))
    {
        tabSize = 32.0;
    }
    
    CGRect tabFrame = self.tabBar.frame;
    
    tabFrame.size.height = tabSize;
    
    tabFrame.origin.y = self.view.frame.origin.y + self.navigationController.navigationBar.frame.size.height + 20;
    tabFrame.size.width = self.view.frame.size.width;
    
    self.tabBar.frame = tabFrame;
    self.tabBar.backgroundColor = [UIColor colorWithRed:0 green:166/255 blue:255/255 alpha:1];
    self.tabBar.tintColor = [UIColor whiteColor];
    
    
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
