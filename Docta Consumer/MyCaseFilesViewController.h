//
//  MyCaseFilesViewController.h
//  Docta Consumer
//
//  Created by RSTI E-Services on 12/06/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCaseFilesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mySubmittedCaseFiles;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
