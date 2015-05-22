//
//  ECWNetworkingHelper.m
//  eclinicalmobile
//
//  Created by prashant on 04/05/15.
//  Copyright (c) 2015 ecw. All rights reserved.
//

#import "ECWNetworkingHelper.h"


@implementation ECWNetworkingHelper

-(instancetype)init{
    if((self = [super init])){
        executing = NO;
        finished = NO;
        
        self.activityIndicator = [[YRActivityIndicator alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        self.activityIndicator.itemColor = [UIColor colorWithRed:0.0 green:34.0/255.0 blue:85.0/255.0 alpha:1.000];
        
        appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

        [appDelegate.window addSubview:self.activityIndicator];
        self.activityIndicator.hidden=YES;
        self.activityIndicator.center = appDelegate.window.center;
    }
    return self;
}
- (BOOL)isConcurrent {
    return YES;
}
- (BOOL)isExecuting {
    return executing;
}

- (BOOL)isFinished {
    return finished;
}

//-(void)start{
//  
//}

- (void)completeOperation {
     [self stopAnimate];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [self willChangeValueForKey:@"isFinished"];
    [self willChangeValueForKey:@"isExecuting"];
    
   executing = NO;
    finished = YES;
    
    [self didChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isFinished"];
}
-(void)start{
    // Always check for cancellation before launching the task.
    if ([self isCancelled])
    {
        // Must move the operation to the finished state if it is canceled.
        [self willChangeValueForKey:@"isFinished"];
        finished = YES;
        [self didChangeValueForKey:@"isFinished"];
        [self stopAnimate];
        return;
    }

    // If the operation is not canceled, begin executing the task.
    [self willChangeValueForKey:@"isExecuting"];
    [NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
    executing = YES;
    [self didChangeValueForKey:@"isExecuting"];
    
}
-(void)main{
  
    self.responseData = [[NSMutableData alloc] init];
    @try {
        NSURLConnection* connection = [[NSURLConnection alloc] initWithRequest:self.request delegate:self startImmediately:NO];
        if(!connection)
        {
            NSLog(@"connection gone");
        }
        else
        {
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
            [connection scheduleInRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
            [connection start];
            [self performSelectorOnMainThread:@selector(startAnimate) withObject:nil waitUntilDone:NO];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"ERROR =%@",[exception debugDescription]);
    }
    @finally {
        
    }
   

}
-(void)startAnimate{
    self.activityIndicator.hidden =NO;
    [self.activityIndicator startAnimating];
}
-(void)stopAnimate{
    [self.activityIndicator stopAnimating];
    [self.activityIndicator setHidesWhenStopped:YES];
}
#pragma mark - URLConnection Delegate
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    if([self isCancelled]){
        [self cancel];
        return;
    }else{
        [self completeOperation];
    }
    
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    if([self isCancelled]){
        [self cancel];
        return;
    }
    [self.responseData appendData:data];
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Check if the operation has been cancelled
    if([self isCancelled]) {
        [self cancel];
        return;
    }
    
    NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
    NSInteger statusCode = [httpResponse statusCode];
    if( statusCode == 200 ) {
        NSUInteger contentSize = [httpResponse expectedContentLength] > 0 ? [httpResponse expectedContentLength] : 0;
        self.responseData = [[NSMutableData alloc] initWithCapacity:contentSize];
    } else {
        NSString* statusError  = [NSString stringWithFormat:NSLocalizedString(@"HTTP Error: %ld", nil), statusCode];
        NSDictionary* userInfo = [NSDictionary dictionaryWithObject:statusError forKey:NSLocalizedDescriptionKey];
        _error = [[NSError alloc] initWithDomain:@"ResponseErrorOperation"
                                            code:statusCode
                                        userInfo:userInfo];
        [self completeOperation];
    }
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    if([self isCancelled]){
        [self cancel];
        return;
    }else{
        NSError *jsonError= nil;
        self.userReadableResponse = [NSJSONSerialization JSONObjectWithData:self.responseData options:NSJSONReadingAllowFragments error:&jsonError];
    
        [self completeOperation];
    }
    
}
#pragma mark - GET/POST methods
-(void)initwithGETRequestURL:(NSString * )requesturl action:(NSString *)action query:(NSString *)querystring withTag:(long)atag{

    self.tag=atag;
 
    self.request =[self loadUrl:requesturl forAction:action query:querystring];
}
-(id) loadAsyncResponseForAction:(NSString*) action queryDetails:(NSString *) queryStr
{
    NSMutableURLRequest *request=[self loadUrlForAction:action query:queryStr];
    
    if ([appDelegate checkInternetConnection]) {
        
        NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
        if (!conn) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"YOUR SESSION HAS EXIPRED" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }else{
            if([action caseInsensitiveCompare:@"getFacilityList"] != NSOrderedSame){
                [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
            }
        }
        return self;
    }
    else    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Could not connect to internet" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return nil;
    }
}
-(NSMutableURLRequest*) loadUrlForAction:(NSString*) action query:(NSString*) requestQuery{
    NSMutableString *queryString;
    NSURL *url=[NSURL URLWithString:[self encodeUrlForString: queryString]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    queryString = nil;
    return request;
}
-(id)loadAsyncResponseForURL:(NSString *)strUrl forAction:(NSString*) action queryDetails:(NSString *) queryStr
{
    //    NSLog(@"Query Str= %@",queryStr);
    
    //    NSMutableURLRequest *request=[self loadUrlForAction:action query:queryStr];
    NSMutableURLRequest *request=[self loadUrl:strUrl forAction:action query:queryStr];

    return request;
}
-(NSMutableURLRequest*) loadUrl:(NSString*)strUrl forAction:(NSString*) action query:(NSString*) requestQuery{
    NSMutableString *queryString ;
    NSURL *url=[NSURL URLWithString:[self encodeUrlForString: queryString]];
  
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    queryString = nil;
    return request;
}
-(NSString*) encodeUrlForString:(NSString*) url{
    return [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

@end
