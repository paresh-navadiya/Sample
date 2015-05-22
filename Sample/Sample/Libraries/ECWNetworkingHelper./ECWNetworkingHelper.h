//
//  ECWNetworkingHelper.h
//  eclinicalmobile
//
//  Created by prashant on 04/05/15.
//  Copyright (c) 2015 ecw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Constant.h"
#import "AppDelegate.h"
#import "YRActivityIndicator.h"

@interface ECWNetworkingHelper : NSOperation <NSURLConnectionDelegate,NSURLConnectionDataDelegate>{
    BOOL        executing;
    BOOL        finished;
    
    AppDelegate *appDelegate;
}
@property (strong,readwrite)  NSMutableURLRequest *request;
@property (strong)  NSURLResponse *response;
@property (strong,readwrite)  NSMutableData *responseData;
@property (assign,readwrite)  id userReadableResponse;
@property (strong) NSError     *error;
@property (strong)YRActivityIndicator* activityIndicator;
@property (assign,readwrite) long tag;

-(void)initwithGETRequestURL:(NSString * )requesturl action:(NSString *)action query:(NSString *)querystring withTag:(long)atag;
@end
