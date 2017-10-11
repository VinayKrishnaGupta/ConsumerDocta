//
//  CasefileDetailsTabbarViewController.m
//  Docta Consumer
//
//  Created by RSTI E-Services on 10/10/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

#import "CasefileDetailsTabbarViewController.h"
#import "Docta_Consumer-Swift.h"

@interface CasefileDetailsTabbarViewController ()

@end

@implementation CasefileDetailsTabbarViewController

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
    
    //    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 120, 40)];
    //    [button setTitle:@"Create Casefile" forState:UIControlStateNormal];
    //    button.backgroundColor = [UIColor colorWithRed:0.08 green:0.65 blue:1 alpha:1];
    //    button.layer.cornerRadius = 15;
    //    button.titleLabel.font = [UIFont fontWithName:@"Rubik" size:15];
    //    [button addTarget:self action:@selector(GotoCreateCaseFile) forControlEvents:UIControlEventTouchUpInside];
    //    UIBarButtonItem *RightButton = [[UIBarButtonItem alloc]initWithCustomView:button];
    //    self.navigationItem.rightBarButtonItem = RightButton;
    
    //let SignupBarButton = UIBarButtonItem.init(image: UIImage.init(named: "useraccount"), style: UIBarButtonItemStyle.done, target: self, action: #selector(SignupButton))
    UIBarButtonItem *createButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"createcasefile"] style:UIBarButtonItemStyleDone target:self action:@selector(GotoCreateCaseFile)];
    UIBarButtonItem *MenuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStyleDone target:self action:@selector(MenuButtonmethod)];
    UIBarButtonItem *SignupButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"useraccount"] style:UIBarButtonItemStyleDone target:self action:@selector(SignupButtonmethod)];
    UIBarButtonItem *NotificationButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"notification"] style:UIBarButtonItemStyleDone target:self action:@selector(NotificationButtonMethod)];
    
    
    
    
    
    
    self.navigationItem.rightBarButtonItems = @[MenuButton, SignupButton, NotificationButton, createButton];
    
    
}
-(void)GotoCreateCaseFile {
    
    [self.navigationController popToRootViewControllerAnimated:NO];
    
    //    UIStoryboard *storybard = [UIStoryboard storyboardWithName:@"SubmitCase" bundle:nil];
    //    UIViewController *vc = [storybard instantiateViewControllerWithIdentifier:@"casesTabbar"];
    //    [self.navigationController pushViewController:vc animated:YES];
    
    
}

- (void)SignupButtonmethod {
    UIStoryboard *storybard = [UIStoryboard storyboardWithName:@"Auth" bundle:nil];
    UIViewController *vc = [storybard instantiateViewControllerWithIdentifier:@"SignupVC"];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)MenuButtonmethod {
    
    // SideMenuController *SideVC = [[SideMenuController alloc] init];
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
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
