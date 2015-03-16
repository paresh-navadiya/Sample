//
//  AppDelegate.m
//  Sample
//
//  Created by ECWIT on 09/03/15.
//  Copyright (c) 2015 ECWIT. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void(^)(NSDictionary *replyInfo))reply{
    // Receives text input result from the WatchKit app extension.
    NSLog(@"User Info: %@", userInfo);
    
    NSString *strUserID = [userInfo objectForKey:@"TextInput"];
    
    NSDate *now = [NSDate date];
    //NSDate *dateBeforeADay = [now dateByAddingTimeInterval:-60*60*24];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:now];
    //NSDate *today1 = [calendar dateFromComponents:components];
    NSString *strStartDate = [NSString stringWithFormat:@"%ld-%ld-%ld",(long)components.year,(long)components.month,(long)components.day];
    
    //NSString *strEndDate = [NSString stringWithFormat:@"%ld-%ld-%ld",(long)components.year,(long)components.month,(long)components.day];
    
    NSString *strURL = nil;
    strURL = [NSString stringWithFormat:@"%@/rest/iPad/TimeTracker/getMeetingDataByResource?searchbyColName=resource&value=%@|%@|%@&orderby=StartTime&userid=%@&isrange=0",kServerName,strUserID,strStartDate,strStartDate,strUserID];
    
    strURL =[strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",strURL);
    NSURL *urlLink = [[NSURL alloc] initWithString:strURL];
    
    // Create the request.
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:urlLink cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
    //[urlRequest setValue:@"1234567890" forHTTPHeaderField:@"Authorization"];
    [urlRequest setValue:@"1" forHTTPHeaderField:@"confapp"];
    
    if ([self checkInternetConnection])
    {
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:urlRequest];
        operation.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            
            NSData *data = (NSData *)responseObject;
            
            NSError * parsedError = nil;
            
            NSDictionary *dictTTAndTask = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&parsedError];
            
            if (parsedError == nil)
            {
                
                NSArray *arrTimeTracker = [dictTTAndTask objectForKey:@"eventlist"];
                
                NSArray *arrTasks = [dictTTAndTask objectForKey:@"tasklist"];
                
                NSMutableArray *mutArrTotal = [NSMutableArray array];
                [mutArrTotal addObjectsFromArray:arrTimeTracker];
                [mutArrTotal addObjectsFromArray:arrTasks];
                
                reply(@{@"message" : [NSNull null],@"data":mutArrTotal});
            }
            else
            {
                NSLog(@"error while parsing json data");
                
                reply(@{@"message" : [parsedError description],@"data":[NSNull null]});
            }
            
            
        } failure:^(AFHTTPRequestOperation *request, NSError *error){
            
            NSLog(@"Error:------>%@", [error description]);
            
            reply(@{@"message" : [error description],@"data":[NSNull null]});
        }];
        
        [[NSOperationQueue mainQueue] addOperation:operation];
    }
    else
    {
        
        //NSLog(@"No connection");
        
        reply(@{@"message" : @"No internet connection",@"data":[NSNull null]});
    }
    
    // Sends a confirmation message to the WatchKit app extension that the text input result was received.
    //reply(@{@"Confirmation" : @"Text was received."});
}

#pragma mark - Check InternetConnection Method

-(BOOL)checkInternetConnection
{
    //    __block BOOL isAvailable;
    // Allocate a reachability object
    Reachability* reach = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    //    // Set the blocks
    //    reach.reachableBlock = ^(Reachability*reach)
    //    {
    //        //NSLog(@"REACHABLE!");
    //        isAvailable = YES;
    //    };
    //
    //    reach.unreachableBlock = ^(Reachability*reach)
    //    {
    //        //NSLog(@"UNREACHABLE!");
    //        isAvailable = NO;
    //    };
    
    return [reach isReachable];
    
}


#pragma mark - Apple Watch method 

-(void)getTimeTackerAndTaskForMonth:(NSString *)strUserID
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:now];
    //NSDate *today1 = [calendar dateFromComponents:components];
    NSString *strStartDate = [NSString stringWithFormat:@"%ld-%ld-%ld",(long)components.year,(long)components.month,(long)components.day];
    
    NSString *strEndDate = [NSString stringWithFormat:@"%ld-%ld-%ld",(long)components.year,(long)components.month,(long)components.day];
    
    NSString *strURL = nil;
    strURL = [NSString stringWithFormat:@"%@/rest/iPad/TimeTracker/getMeetingDataByResource?searchbyColName=resource&value=%@|%@|%@&orderby=StartTime&userid=%@&isrange=1",kServerName,strUserID,strStartDate,strEndDate,strUserID];
    
    strURL =[strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",strURL);
    NSURL *urlLink = [[NSURL alloc] initWithString:strURL];
    
    // Create the request.
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:urlLink cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
    //[urlRequest setValue:@"1234567890" forHTTPHeaderField:@"Authorization"];
    [urlRequest setValue:@"1" forHTTPHeaderField:@"confapp"];
    
    if ([self checkInternetConnection])
    {
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:urlRequest];
        operation.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            
            NSData *data = (NSData *)responseObject;
            
            NSError * parsedError = nil;
            
            NSDictionary *dictTTAndTask = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&parsedError];
            
            if (parsedError == nil)
            {
                
                NSArray *arrTimeTracker = [dictTTAndTask objectForKey:@"eventlist"];
                
                NSArray *arrTasks = [dictTTAndTask objectForKey:@"tasklist"];
                
                NSMutableArray *mutArrTotal = [NSMutableArray array];
                [mutArrTotal addObjectsFromArray:arrTimeTracker];
                [mutArrTotal addObjectsFromArray:arrTasks];
                
                //reply(@{@"message" : [NSNull null],@"data":mutArrTotal});
            }
            else
            {
                NSLog(@"error while parsing json data");
                
                //reply(@{@"message" : [parsedError description],@"data":[NSNull null]});
            }
            
            
        } failure:^(AFHTTPRequestOperation *request, NSError *error){
            
            NSLog(@"Error:------>%@", [error description]);
            
            //reply(@{@"message" : [error description],@"data":[NSNull null]});
        }];
        
        [[NSOperationQueue mainQueue] addOperation:operation];
    }
    else
    {
        
        NSLog(@"No internet connection");
        
        //reply(@{@"message" : @"No internet connection",@"data":[NSNull null]});
    }
    
}


@end
