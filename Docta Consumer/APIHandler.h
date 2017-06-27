//
//  APIHandler.h
//  Docta Consumer
//
//  Created by RSTI E-Services on 19/06/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIHandler : NSObject
+ sharedInstance;
+ (NSDictionary *) PostCallAPI: (NSDictionary *)fromParameter completionBlock:(void (^) (id data, NSError *error)) completionBlock;
-(void)GetDatafromAPI:(NSString *)methodName :(NSString *)APIpath  :(NSDictionary *)WithParameters completionBlock:(void (^) (id data, NSError *error)) completionBlock;
@end
