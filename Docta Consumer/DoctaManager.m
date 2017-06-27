//
//  DoctaManager.m
//  Docta Consumer
//
//  Created by RSTI E-Services on 20/06/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

#import "DoctaManager.h"

@implementation DoctaManager
static DoctaManager *singletonObject = nil;

+ (id) sharedInstance
{
    if (! singletonObject) {
        
        singletonObject = [[DoctaManager alloc] init];
        
    }
    return singletonObject;
}

- (id)init
{
    if (! singletonObject) {
        
        singletonObject = [super init];
        // Uncomment the following line to see how many times is the init method of the class is called
        NSLog(@"%s", __PRETTY_FUNCTION__);
    }
    return singletonObject;
}


-(NSString *)DateFormatConverter : (NSString *)DateinOtherFormat {
    NSString *dateReceivedInString = DateinOtherFormat;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
  //  NSString *Daterecieved = [NSString stringWithFormat:@"%@",[dateFormatter dateFromString:dateReceivedInString]];
    NSDateFormatter *shortformat = [[NSDateFormatter alloc]init];
    [shortformat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *parsedDate = [dateFormatter dateFromString:dateReceivedInString];
    NSString *convertedDate = [shortformat stringFromDate:parsedDate];
    
    return convertedDate;
}



@end
