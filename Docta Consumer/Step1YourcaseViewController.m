//
//  Step1YourcaseViewController.m
//  Docta Consumer
//
//  Created by RSTI E-Services on 07/07/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

#import "Step1YourcaseViewController.h"
#import <DLRadioButton/DLRadioButton.h>

@interface Step1YourcaseViewController ()
- (IBAction)nextButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;





@end

@implementation Step1YourcaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed: @"DoctaLogo"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(10, 2, 100, 30);
    [self.navigationController.navigationBar addSubview:imageView];
    
    
    
    
    
    [_button1 addTarget:self action:@selector(howlongradiobutton) forControlEvents:UIControlEventTouchUpInside];
    [_button2 addTarget:self action:@selector(howlongradiobutton) forControlEvents:UIControlEventTouchUpInside];
    [_button3 addTarget:self action:@selector(howlongradiobutton) forControlEvents:UIControlEventTouchUpInside];
    [_button4 addTarget:self action:@selector(howlongradiobutton) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//- (IBAction)logSelectedButton:(DLRadioButton *)radioButton {
//    if (radioButton.isMultipleSelectionEnabled) {
//        for (DLRadioButton *button in radioButton.selectedButtons) {
//            NSLog(@"%@ is selected.\n", button.titleLabel.text);
//        }
//    } else {
//        NSLog(@"%@ is selected.\n", radioButton.selectedButton.titleLabel.text);
//    }
//}


-(void)howlongradiobutton {
    if (_button1.touchInside) {
        _button1.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:206.0f/255.0f blue:74.0f/255.0f alpha:1];
        [_button1 setTitleColor:[UIColor colorWithRed:255.0f/255.0f green:98.0f/255.0f blue:2.0f/255.0f alpha:1] forState:UIControlStateNormal];
        _button2.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_button2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _button3.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_button3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _button4.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_button4 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        
    }
    else if (_button2.touchInside) {
        _button2.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:206.0f/255.0f blue:74.0f/255.0f alpha:1];
        [_button2 setTitleColor:[UIColor colorWithRed:255.0f/255.0f green:98.0f/255.0f blue:2.0f/255.0f alpha:1] forState:UIControlStateNormal];
        _button1.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_button1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _button3.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_button3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _button4.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_button4 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        
    }
    else if (_button3.touchInside) {
        _button3.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:206.0f/255.0f blue:74.0f/255.0f alpha:1];
        [_button3 setTitleColor:[UIColor colorWithRed:255.0f/255.0f green:98.0f/255.0f blue:2.0f/255.0f alpha:1] forState:UIControlStateNormal];
        _button2.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_button2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _button1.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_button1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _button4.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_button4 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        
    }
    else if (_button4.touchInside) {
        _button4.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:206.0f/255.0f blue:74.0f/255.0f alpha:1];
        [_button4 setTitleColor:[UIColor colorWithRed:255.0f/255.0f green:98.0f/255.0f blue:2.0f/255.0f alpha:1] forState:UIControlStateNormal];
        _button2.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_button2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _button3.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_button3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _button1.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_button1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        
    }
    
    
    
    

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)nextButton:(UIButton *)sender {
    [self performSegueWithIdentifier:@"step2symptoms" sender:nil];
    
    
    
}
//
//- (IBAction)howLongButton:(DLRadioButton *)sender {
//    
//    for (DLRadioButton *button in sender.selectedButtons) {
//        
//        NSLog(@"%@ is selected.\n", button.titleLabel.text);
//        if (button.isSelected) {
//            [button setBackgroundColor:[UIColor orangeColor]];
//        }
//        else {
//            [button setBackgroundColor:[UIColor blackColor]];
//        }
//        
//        
//    }

    
    
    
//}
@end
