//
//  ViewCaseFileViewController.m
//  Docta Consumer
//
//  Created by RSTI E-Services on 22/06/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

#import "ViewCaseFileViewController.h"

@interface ViewCaseFileViewController () {
    NSArray *DoctorsList;
}

@end

@implementation ViewCaseFileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    DoctorsList = @[@"Dr. Sanjay", @"Dr. Rockford", @"Dr. Singh"];
    
    // Do any additional setup after loading the view.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return DoctorsList.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [DoctorsList objectAtIndex:indexPath.section];
    cell.imageView.image = [UIImage imageNamed:@"envelope"];
    
    
    return cell;
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
