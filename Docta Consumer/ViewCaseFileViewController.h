//
//  ViewCaseFileViewController.h
//  Docta Consumer
//
//  Created by RSTI E-Services on 22/06/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewCaseFileViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
