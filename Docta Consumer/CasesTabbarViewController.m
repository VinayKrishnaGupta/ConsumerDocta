//
//  CasesTabbarViewController.m
//  DoctaPartner
//
//  Created by RSTI E-Services on 05/07/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

#import "CasesTabbarViewController.h"
#import "Docta_Consumer-Swift.h"
#import "APIHandler.h"


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

-(void)viewWillAppear:(BOOL)animated {
    [[APIHandler sharedInstance]GetDatafromAPI:@"POST" :@"casefilelist" :nil  completionBlock:^(id dict, NSError *error)
     
     {
         
        // NSLog(@"Response Dict in signin is %@  and Error is %@",dict,error );
         if ([dict isKindOfClass:[NSDictionary class]]) {
         
             NSMutableArray *allCaseFiles = [dict valueForKey:@"data"];
        
             
             NSLog(@"All Casefiles are %@",allCaseFiles);
             NSMutableArray *openCasefiles = [[NSMutableArray alloc]init];
             NSMutableArray *closeCasefiles = [[NSMutableArray alloc]init];
             
             for (NSDictionary* item in allCaseFiles) {
                 BOOL Isoopen = [[item objectForKey:@"isOpen"] boolValue];
                 NSLog(@"Bool value is %d and Dictioanry is %@",Isoopen,[item valueForKey:@"isOpen"]);
                 
                 if (Isoopen) {
                     [openCasefiles addObject:item];
                     NSLog(@"Open Case File is %@",openCasefiles);
                     OpenCaseViewController *openVC = [[self viewControllers] objectAtIndex:0];
                     openVC.OpenCasesList = openCasefiles;
                   //  [openVC viewWillAppear:YES];
                     [openVC ReloadData];
                     
                     
                     
                 }
                 else {
                     [closeCasefiles addObject:item];
                     NSLog(@"Closed Case File is %@",closeCasefiles);
                     CloseCasesViewController *closeVC = [[self viewControllers] objectAtIndex:1];
                     closeVC.ClosedCaseList = closeCasefiles;
                     [closeVC ReloadData];
                     
                     
                     
                 }
                 
                 
                 
             }
                 
         
             
             
             
             
         }
         else {
             NSLog(@"Error is Login");
             OpenCaseViewController *openVC = [[self viewControllers] objectAtIndex:0];
             [openVC ReloadData];
             CloseCasesViewController *closedVC = [[self viewControllers] objectAtIndex:1];
             [closedVC ReloadData];
         }
         
     }];

    
}


/*
 let menuButton = UIBarButtonItem.init(image: UIImage.init(named: "menu"), style: UIBarButtonItemStyle.done, target: self, action: #selector(revealSideBarfromButton))
 
 let homeButton = UIBarButtonItem.init(image: UIImage.init(named: "createcasefile"), style: UIBarButtonItemStyle.done, target: self, action: #selector(GotoHomeButton))
 let notificationbutton = UIBarButtonItem.init(image: UIImage.init(named: "notification"), style: UIBarButtonItemStyle.done, target: self, action: #selector(notificationButton))
 
 
 self.navigationItem.rightBarButtonItems = [menuButton, SignupBarButton,notificationbutton, homeButton]
 
 // Do any additional setup after loading the view.
 }
 
 
 func revealSideBarfromButton() {
 
 sideMenuController?.toggle()
 
 
 }
 
 func notificationButton() {
 SVProgressHUD.showInfo(withStatus: "Coming Soon...")
 SVProgressHUD.dismiss(withDelay: 2)
 
 }
 
 func GotoHomeButton() {
 
 //createcasefile
 self.navigationController?.popViewController(animated: false)
 
 }
 
 func SignupButton() {
 
 
 let storyboard = UIStoryboard(name: "Auth", bundle: nil)
 let controller = storyboard.instantiateViewController(withIdentifier: "SignupVC")
 self.navigationController?.pushViewController(controller, animated: true)
 
 
 
 
 }
 
 
*/




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
