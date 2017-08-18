//
//  APIHandler.m
//  Docta Consumer
//
//  Created by RSTI E-Services on 19/06/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

#import "APIHandler.h"
#import <AFNetworking/AFNetworking.h>

@implementation APIHandler
static APIHandler *singletonObject = nil;
NSDictionary *Dict;
+ (id) sharedInstance
{
    if (! singletonObject) {
        
        singletonObject = [[APIHandler alloc] init];
        
    }
    return singletonObject;
}


-(void)GetDatafromAPI:(NSString *)methodName :(NSString *)APIpath  :(NSDictionary *)WithParameters completionBlock:(void (^) (id data, NSError *error)) completionBlock
{
    
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSString *token = [[NSUserDefaults standardUserDefaults]objectForKey:@"AccessToken"];
    NSString *BearerToken = [NSString stringWithFormat:@"Bearer %@",token];
    NSString *url = [NSString stringWithFormat:@"%@/%@",BASE_URL, APIpath];
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:methodName URLString:url parameters:WithParameters error:nil];
    
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    if (token != nil) {
        [req setValue:BearerToken forHTTPHeaderField:@"Authorization"];
        
    }
    else {
        NSLog(@"Token is nil");
        
    }
    
    
    
    
    
    
    [[manager dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (!error) {
         //   NSLog(@"Reply JSON for detail: %@", responseObject);
            completionBlock(responseObject,Nil);
            
            //  [manager respondsToSelector:@selector(APIResponse:)];
            
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                
                
                
            }
        }
        else {
            NSLog(@"Error");
            completionBlock(Nil,error);
            
        }
        
        
    }] resume];


}


+ (NSDictionary *) PostCallAPI: (NSDictionary *)fromParameter completionBlock:(void (^) (id data, NSError *error)) completionBlock  {
   
//    NSString *str = fromString;
//   // NSString *str2 = toString;
//    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"Object1",@"key1", @"Object2",str , nil];
//    NSLog(@"From String is ");
    Dict = [[NSDictionary alloc]init];
    __block NSDictionary *Dict2;
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    
    NSString *url = [NSString stringWithFormat:@"%@/user/login",BASE_URL];
    NSMutableURLRequest *req = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:url parameters:fromParameter error:nil];
    
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    
    
    
    
    [[manager dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (!error) {
            NSLog(@"Reply JSON for detail: %@", responseObject);
            Dict2 = responseObject;
            Dict = responseObject;
    
          //  [manager respondsToSelector:@selector(APIResponse:)];
    
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                completionBlock(responseObject,nil);
            
                
            }
        }
        else {
            NSLog(@"Error");
            completionBlock(nil,error);
            
        }
        
        
    }] resume];
    
    
    
    
    return Dict;
   
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

@end
