//
//  CreateCaseViewController.m
//  Docta Consumer
//
//  Created by RSTI E-Services on 09/06/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

#import "CreateCaseViewController.h"


@interface CreateCaseViewController () {
    NSArray *specialistList;
    NSArray *procedurelists;
    DropDown *dropdown1;
    
}
@property (weak, nonatomic) IBOutlet UITextField *specialistTextField;
@property (weak, nonatomic) IBOutlet UITextField *ProcedureTextField;

@end

@implementation CreateCaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dropdown1 = [[DropDown alloc]init];
    specialistList = @[@"Dentist", @"Neurologist", @"Pain Specialist"];
    procedurelists = @[@"Bonding",@"Headache", @"Stroke" ];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    
    dropdown1.dataSource = specialistList;
    dropdown1.anchorView = _specialistTextField;
    [dropdown1 show];
    int i = 0;
    NSString *selected;
    dropdown1.selectionAction(i, selected);
    
    
    
   
    
    
    
    
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
