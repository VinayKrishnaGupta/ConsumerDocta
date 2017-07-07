//
//  MyCaseFilesViewController.m
//  Docta Consumer
//
//  Created by RSTI E-Services on 12/06/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

#import "MyCaseFilesViewController.h"
#import "APIHandler.h"
#import "DoctaManager.h"

@interface MyCaseFilesViewController () {
    NSMutableArray *MyCaseList;
    
}
@property (weak, nonatomic) IBOutlet UIButton *createCaseFile;

@end

@implementation MyCaseFilesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_createCaseFile addTarget:self action:@selector(CreateNewCaseFileButton) forControlEvents:UIControlEventTouchUpInside];
    MyCaseList = [[NSMutableArray alloc]init];
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [[APIHandler sharedInstance]GetDatafromAPI:@"POST" :@"casefile/list" :nil  completionBlock:^(id dict, NSError *error)
     
     {

        NSLog(@"Response in my list is %@ and Error is %@", dict, error);
        
         
         MyCaseList = [dict valueForKey:@"data"];
         [_tableView reloadData];
         
        
    }];
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return MyCaseList.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
    
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
       return @"My Case Files";
    }
    else {
        return nil;
    }
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSDictionary *dict = [MyCaseList objectAtIndex:indexPath.section];
    cell.textLabel.text = [NSString stringWithFormat:@"Speciality: %@", [dict valueForKey:@"speciality"]];
    NSString *changedString = [[DoctaManager sharedInstance]DateFormatConverter : [dict valueForKey:@"created_at"]];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Created : %@",changedString];
    
    
    
    
    
//    NSString *dateReceivedInString = [dict valueForKey:@"created_at"];
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
//    NSLog(@"ddddd====%@", [dateFormatter dateFromString:dateReceivedInString]);
//    NSString *Daterecieved = [NSString stringWithFormat:@"%@",[dateFormatter dateFromString:dateReceivedInString]];
//        NSDateFormatter *shortformat = [[NSDateFormatter alloc]init];
//         [shortformat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSDate *parsedDate = [dateFormatter dateFromString:dateReceivedInString];
//    NSLog(@"========= REal Date %@",[shortformat stringFromDate:parsedDate]);
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"Created at %@",[shortformat stringFromDate:parsedDate]];
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"CaseDetails" sender:self];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)CreateNewCaseFileButton {
    [self performSegueWithIdentifier:@"createNewCase" sender:nil];
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
