//
//  HTTPRequestVC.m
//  Sample
//
//  Created by ECWIT on 29/05/15.
//  Copyright (c) 2015 ECWIT. All rights reserved.
//

#import "HTTPRequestVC.h"

@interface HTTPRequestVC ()

@end

@implementation HTTPRequestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"HTTP Request";
    
    [self postRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    NSLog(@"%@ is being deallocated",NSStringFromClass([self class]));
}


#pragma mark - Methods

- (void)postRequest
{
    txtViewResponse.text = @"Requesting POST Request";
    
    //initialize url that is going to be fetched.
    NSURL *url = [NSURL URLWithString:@"http://www.w3schools.com/webservices/tempconvert.asmx/CelsiusToFahrenheit"];
    
    //initialize a request from url
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    //set http method
    [request setHTTPMethod:@"POST"];
    //initialize a post data
    NSString *postData = [NSString stringWithFormat:@"celsius=104"];
    //set request content type we MUST set this value.
    
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    //set post data of request
    [request setHTTPBody:[postData dataUsingEncoding:NSUTF8StringEncoding]];
    
    [ISHTTPOperation sendRequest:request handler:^(NSHTTPURLResponse *response, id object, NSError *error)
     {
         if (error) {
             NSLog(@"error: %@", error);
             return;
             
         }
         
         NSString *strData = [[NSString alloc]initWithData:(NSData *)object encoding:NSUTF8StringEncoding];
         
         
         strData = [strData stringByReplacingOccurrencesOfString:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>" withString:@""];
         strData = [strData stringByReplacingOccurrencesOfString:@"<string xmlns=\"http://www.w3schools.com/webservices/\">" withString:@""];
         strData = [strData stringByReplacingOccurrencesOfString:@"</string>" withString:@""];
         strData = [strData stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
         NSLog(@"strData : %@",strData);
         
         NSString *strResponse = [NSString stringWithFormat:@"%@\nFahrenhite=%@",postData,strData];
         strResponse = [strResponse stringByReplacingOccurrencesOfString:@"=" withString:@" = "];
         txtViewResponse.text = strResponse;
         
     }];
}

- (void)stopAllRequest
{
    [[ISHTTPOperationQueue defaultQueue] cancelAllOperations];
}



@end
