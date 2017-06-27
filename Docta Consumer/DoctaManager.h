//
//  DoctaManager.h
//  Docta Consumer
//
//  Created by RSTI E-Services on 20/06/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DoctaManager : NSObject
+ sharedInstance;
-(NSString *)DateFormatConverter : (NSString *)DateinOtherFormat;
@end
