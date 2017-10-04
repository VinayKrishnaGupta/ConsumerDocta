//
//  SpecialitsTabBarViewController.m
//  Docta Consumer
//
//  Created by RSTI E-Services on 11/09/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

#import "SpecialitsTabBarViewController.h"
#import "Docta_Consumer-Swift.h"

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

    
   
    UIBarButtonItem *createButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"createcasefile"] style:UIBarButtonItemStyleDone target:self action:@selector(GotoCreateCaseFile)];
    UIBarButtonItem *MenuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStyleDone target:self action:@selector(MenuButtonmethod)];
    UIBarButtonItem *SignupButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"useraccount"] style:UIBarButtonItemStyleDone target:self action:@selector(SignupButtonmethod)];
    UIBarButtonItem *NotificationButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"notification"] style:UIBarButtonItemStyleDone target:self action:@selector(NotificationButtonMethod)];
    
    
    
    
    
    
    self.navigationItem.rightBarButtonItems = @[MenuButton, SignupButton, NotificationButton, createButton];
    
    
}
-(void)GotoCreateCaseFile {
    NSLog(@"Create Case file button clicked");
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)SignupButtonmethod {
    UIStoryboard *storybard = [UIStoryboard storyboardWithName:@"Auth" bundle:nil];
    UIViewController *vc = [storybard instantiateViewControllerWithIdentifier:@"SignupVC"];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)MenuButtonmethod {
    
   
    // [SideVC.sideMenuController toggle];
    [self.sideMenuController toggle];
    //  [self sideVC.sideMenuController.toggle];
    //sideMenuController?.toggle()
    
}

-(void)NotificationButtonMethod {
    
    
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
    CGRect tabFrame = CGRectNull;
    tabFrame = self.tabBar.frame;
    UINavigationBar.appearance.translucent = YES;
    tabFrame.size.height = tabSize;
    
    int navsize = self.navigationController.navigationBar.frame.size.height;
  //  int vieworigin = self.view.frame.origin.y;
    tabFrame.origin.y =  navsize + 20 ;
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
