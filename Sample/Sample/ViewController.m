//
//  ViewController.m
//  Sample
//
//  Created by ECWIT on 09/03/15.
//  Copyright (c) 2015 ECWIT. All rights reserved.
//

#import "ViewController.h"

#import <QuartzCore/QuartzCore.h>

@implementation UIView (Additions)

- (CGRect)getBorderLessFrame {
    CGRect frame = self.frame;
    frame.origin.x += self.layer.borderWidth;
    frame.origin.y += self.layer.borderWidth;
    frame.size.width -= 2*self.layer.borderWidth;
    frame.size.height -= 2*self.layer.borderWidth;
    return frame;
}
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
@implementation UITextField (custom)
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + 10, bounds.origin.y,
                      bounds.size.width - 10, bounds.size.height);
}
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [self textRectForBounds:bounds];
}
@end
#pragma clang diagnostic pop

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //self.navigationController.navigationBar.hidden = YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleDoubleTap:)];
    tapGesture.numberOfTapsRequired = 2;
    
    [self.view addGestureRecognizer:tapGesture];
    
    //intially it will be NO we want to be also NO as navigation bar is visible
    isBarHidden = NO;
    
    //Important Note
    
//    self.view.layer.borderWidth = 10;
//    NSLog(@"%@ : %@",NSStringFromCGRect(self.view.frame) ,NSStringFromCGRect([self.view getBorderLessFrame]));
//    self.view.layer.borderWidth = 0;
    
//    JLPDFGenerator *objJLPDFGenerator = [JLPDFGenerator new];
//    [objJLPDFGenerator setupPDFDocumentNamed:@"test" withSize:kSizeA4Portrait];
//    
//    [objJLPDFGenerator beginPDFPage];
//    [objJLPDFGenerator addText:@"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.  Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda." withFrame:CGRectMake(10, 10, kSizeA4Portrait.width, kSizeA4Portrait.height) withFont:[UIFont boldSystemFontOfSize:17.0f] withColor:[UIColor redColor] textAlignment:NSTextAlignmentLeft verticalAlignment:NSVerticalAlignmentTop];
//    
//    [objJLPDFGenerator addLineFromPoint:CGPointMake(20, 300) toEndPoint:CGPointMake(3000, 300) withColor:[UIColor redColor] andWidth:1.0f];
//    [objJLPDFGenerator finishPDF];
//    
//
    
    
    
    //create circle chart //(SCREEN_HEIGHT/2.0)-70.0
    circleChart = [[PNCircleChart alloc] initWithFrame:CGRectMake((SCREEN_WIDTH/2.0)-100.0,90.0,200.0,140.0) total:@100 current:@60 clockwise:YES];
        
    circleChart.backgroundColor = [UIColor clearColor];
    
    //1st option no stroke color but default color
    
    //2nd option add gradiant
    //[circleChart setStrokeColor:[UIColor clearColor]];
    //[circleChart setStrokeColorGradientStart:[appDelegate colorWithHexString:@"4dffaa"]];
    
    //3rd option no gradiant but custom color
    //[circleChart setStrokeColor:[appDelegate colorWithHexString:@"4dffaa"]];
    
    [circleChart strokeChart];
    
    [self.view addSubview:circleChart];
    
    [self performSelector:@selector(reloadCircleChart) withObject:nil afterDelay:3.0f];

    //add VAProgressCircle
    [self addChart];
    
//    NSString *dataUrl = @"http://api.openweathermap.org/data/2.5/weather?q=London,uk";
//    NSURL *url = [NSURL URLWithString:dataUrl];
//    
//    // 2
//    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
//                                          dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//                                              NSLog(@"%@");
//                                          }];
//    
//    // 3
//    [downloadTask resume];
//    
//    //1
//    NSURL *url1 = [NSURL URLWithString:@"http://upload.wikimedia.org/wikipedia/commons/7/7f/Williams_River-27527.jpg"];
//    
//    // 2
//    NSURLSessionDownloadTask *downloadPhotoTask = [[NSURLSession sharedSession]
//                                                   downloadTaskWithURL:url1 completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
//                                                       // 3
//                                                       UIImage *downloadedImage = [UIImage imageWithData:
//                                                                                   [NSData dataWithContentsOfURL:location]];
//                                                       NSLog(@"%@",downloadedImage);
//                                                   }];
//    
//    // 4	
//    [downloadPhotoTask resume];
    
    
    //https://github.com/JV17/YoutubePlayer
    
    tblViewAddCustomer.tableFooterView = [UIView new];
    
    mutArrAddCustomerData = [NSMutableArray array];
    
    [mutArrAddCustomerData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"cell1",@"cellidentifier",@"",@"header",@"",@"customername",@"",@"companyname",@"",@"contact",@"0",@"issubcustomer",@"",@"subcustomer",@"0",@"isbillwithparent",nil]];
    
    [mutArrAddCustomerData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"cell2",@"cellidentifier",@"",@"header",@"",@"phone",@"",@"mobile",@"",@"fax",@"0",@"email",nil]];
    
    [mutArrAddCustomerData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"cell3",@"cellidentifier",@"Billing Address",@"header",@"",@"address1",@"",@"address2",@"",@"address3",@"",@"city",@"",@"region",@"",@"pincode",@"",@"country",@"0",@"addshippingaddress",@"0",@"copyshippingaddress",nil]];
    
    [mutArrAddCustomerData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"cell4",@"cellidentifier",@"",@"header",@"",@"terms",nil]];
    
    [mutArrAddCustomerData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"cell5",@"cellidentifier",@"",@"header",@"",@"otherdetails",nil]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - 
#pragma mark -  Add VAProgressCircle
- (void)addChart
{
    UIColor *lightGreen = [UIColor colorWithRed:77.0 / 255.0 green:186.0 / 255.0 blue:122.0 / 255.0 alpha:1.0f];
    
    progressChart = [[VAProgressCircle alloc] initWithFrame:CGRectMake(60, 300, 200, 200)];
    [progressChart setColor:lightGreen withHighlightColor:lightGreen];
    [progressChart setTransitionColor:lightGreen withHighlightTransitionColor:lightGreen];
    progressChart.transitionType = VAProgressCircleColorTransitionTypeGradual;
    [self.view addSubview:progressChart];
    
    randomTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(randomIncrement) userInfo:nil repeats:YES];
}

- (void)resetChart
{
    circleProgress = 0;
    
    if([randomTimer isValid])
    {
        [randomTimer invalidate];
    }
    
    [progressChart removeFromSuperview];
    progressChart = nil;
    
    [self addChart];
}

- (void)randomIncrement
{
    if(arc4random() % 2 == 1)
    {
        [self addProgress];
    }
}

- (void)addProgress
{
    int randomIncrement = circleProgress + arc4random_uniform(101 - circleProgress) / 3;
    
    if(circleProgress != randomIncrement && randomIncrement > circleProgress)
    {
        circleProgress = randomIncrement;
        [progressChart setProgress:circleProgress];
    }
    else
    {
        circleProgress++;
        [progressChart setProgress:circleProgress];
    }
    
    if (circleProgress == 100) {
        NSLog(@"reset here");
        
        //[self resetChart];
        [self performSelector:@selector(resetChart) withObject:nil afterDelay:4.0f];
    }
}

-(void)dealloc
{
    NSLog(@"%@ is being deallocated",NSStringFromClass([self class]));
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}

-(void)reloadCircleChart
{
    [circleChart updateChartByCurrent:@00 byTotal:@100];
    [circleChart updateChartByCurrent:@60 byTotal:@100];
    
    [self performSelector:@selector(reloadCircleChart) withObject:nil afterDelay:3.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Methods

-(void)handleDoubleTap:(UITapGestureRecognizer *)tapGesture
{
    NSLog(@"double tap");
        
    if (!isBarHidden)
        self.navigationController.navigationBar.hidden = YES;
    else
        self.navigationController.navigationBar.hidden = NO;
    
    isBarHidden = !isBarHidden;
}

#pragma mark - ISHTTPOperation Methods

- (void)stopAllRequest
{
    [[ISHTTPOperationQueue defaultQueue] cancelAllOperations];
}

- (void)startRequest
{
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
         NSLog(@"strData : %@",strData);
        
     }];
}


#pragma mark - UIWebViewD
- (void)webViewDidFinishLoad:(UIWebView *)webView1
{
    NSLog(@"WebView Loaded");
}
- (void)webView:(UIWebView *)webView1 didFailLoadWithError:(NSError *)error
{
    NSLog(@"Error : %@",[error description]);
}


#pragma mark -
#pragma mark - UITableViewDataSource & Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [mutArrAddCustomerData count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        NSDictionary *dictData = [mutArrAddCustomerData objectAtIndex:indexPath.section];
        
        NSString *strIsSubCustomer = [dictData objectForKey:@"issubcustomer"];
        if ([strIsSubCustomer isEqualToString:@"0"]) {
            return 195.0f;
        }
        else
        {
            return 290.0f;
        }
    }
    else if (indexPath.section == 1)
    {
        return 185.0f;
    }
    else if (indexPath.section == 2)
    {
        return 318.0f;
    }
    else if (indexPath.section == 3)
    {
        NSDictionary *dictData = [mutArrAddCustomerData objectAtIndex:2];
        
        NSString *strIsSubCustomer = [dictData objectForKey:@"addshippingaddress"];
        if ([strIsSubCustomer isEqualToString:@"0"])
            return 54.0f;
        else
            return 274.0f;
    }
    else if (indexPath.section == 4)
    {
        NSDictionary *dictData = [mutArrAddCustomerData objectAtIndex:2];
        
        NSString *strIsSubCustomer = [dictData objectForKey:@"addshippingaddress"];
        if ([strIsSubCustomer isEqualToString:@"0"])
            return 79.0f;
        else
            return 54.0f;
    }
    else if (indexPath.section == 5)
    {
        return 79.0f;
    }
    else 
    {
        return 00.0f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    NSDictionary *dictData = [mutArrAddCustomerData objectAtIndex:section];
    NSString *strHeader = [dictData objectForKey:@"header"];
    if ([strHeader length]==0)
        return 10.0f;
    else
        return 30.0f;

}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSDictionary *dictData = [mutArrAddCustomerData objectAtIndex:section];
    NSString *strHeader = [dictData objectForKey:@"header"];
    
    UILabel *tempLabel=[[UILabel alloc]init];
    [tempLabel setFrame:CGRectMake(0,0,320,10)];
    tempLabel.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.1];;
    //tempLabel.shadowColor = [UIColor whiteColor];
    //tempLabel.shadowOffset = CGSizeMake(0,1);
    tempLabel.textColor = [UIColor blackColor]; //here you can change the text color of header.
    tempLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    if ([strHeader length]==0)
        tempLabel.text=@"";
    else
    {
        NSString *strTitle = [NSString stringWithFormat:@"  %@",strHeader];
        tempLabel.text=strTitle;
    }
    
    return tempLabel;
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [cell setBackgroundColor:[UIColor clearColor]];
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dictData = [mutArrAddCustomerData objectAtIndex:indexPath.section];
    
    NSString *strCellidentifier = [dictData objectForKey:@"cellidentifier"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCellidentifier];
    
    if (cell) {
        
        UIImage *image = [UIImage imageNamed:@"txtfd_bg"];

        if (indexPath.section == 0)
        {
            UITextField *txtFdCustName = (UITextField *)[cell viewWithTag:99];
            if (txtFdCustName) {
                txtFdCustName.background = image;
            }
            
            UITextField *txtFdCompName = (UITextField *)[cell viewWithTag:100];
            if (txtFdCompName) {
                txtFdCompName.background = image;
            }
            
            UITextField *txtFdSubCustName = (UITextField *)[cell viewWithTag:103];
            if (txtFdSubCustName) {
                txtFdSubCustName.background = image;
            }
            
            UIButton *btnIsSubCustomer = (UIButton *)[cell viewWithTag:102];
            NSString *strIsSubCustomer = [dictData objectForKey:@"issubcustomer"];
            if ([strIsSubCustomer isEqualToString:@"0"])
                [btnIsSubCustomer setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
            else
                [btnIsSubCustomer setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
            
            //
            UIButton *btnBillWithParent = (UIButton*)[cell viewWithTag:104];
            NSString *strIsBillWithParent = [dictData objectForKey:@"isbillwithparent"];
            if ([strIsBillWithParent isEqualToString:@"0"])
                [btnBillWithParent setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
            else
                [btnBillWithParent setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
        }
        else if (indexPath.section == 1)
        {
            UITextField *txtFdPhone = (UITextField *)[cell viewWithTag:99];
            if (txtFdPhone) {
                txtFdPhone.background = image;
            }
            
            UITextField *txtFdMobile = (UITextField *)[cell viewWithTag:100];
            if (txtFdMobile) {
                txtFdMobile.background = image;
            }
            
            UITextField *txtFdFax = (UITextField *)[cell viewWithTag:101];
            if (txtFdFax) {
                txtFdFax.background = image;
            }
            
            UITextField *txtFdEmail = (UITextField *)[cell viewWithTag:102];
            if (txtFdEmail) {
                txtFdEmail.background = image;
            }
        }
        else if (indexPath.section == 2)
        {
            UITextField *txtFdAddress1 = (UITextField *)[cell viewWithTag:99];
            if (txtFdAddress1) {
                txtFdAddress1.background = image;
            }
            
            UITextField *txtFdAddress2 = (UITextField *)[cell viewWithTag:100];
            if (txtFdAddress2) {
                txtFdAddress2.background = image;
            }
            
            UITextField *txtFdAddress3 = (UITextField *)[cell viewWithTag:101];
            if (txtFdAddress3) {
                txtFdAddress3.background = image;
            }
            
            UITextField *txtFdCity = (UITextField *)[cell viewWithTag:102];
            if (txtFdCity) {
                txtFdCity.background = image;
            }
            
            UITextField *txtFdRegion = (UITextField *)[cell viewWithTag:103];
            if (txtFdRegion) {
                txtFdRegion.background = image;
            }
            
            UITextField *txtFdPostal = (UITextField *)[cell viewWithTag:104];
            if (txtFdPostal) {
                txtFdPostal.background = image;
            }
            
            UITextField *txtFdCountry = (UITextField *)[cell viewWithTag:105];
            if (txtFdCountry) {
                txtFdCountry.background = image;
            }
        }
        else if (indexPath.section == 3)
        {
            id view  = [cell viewWithTag:99];
            if ([view isKindOfClass:[UITextField class]])
            {
                UITextField *txtFdAddress1 = (UITextField *)view;
                if (txtFdAddress1) {
                    txtFdAddress1.background = image;
                }
                
                UITextField *txtFdAddress2 = (UITextField *)[cell viewWithTag:100];
                if (txtFdAddress2) {
                    txtFdAddress2.background = image;
                }
                
                UITextField *txtFdAddress3 = (UITextField *)[cell viewWithTag:101];
                if (txtFdAddress3) {
                    txtFdAddress3.background = image;
                }
                
                UITextField *txtFdCity = (UITextField *)[cell viewWithTag:102];
                if (txtFdCity) {
                    txtFdCity.background = image;
                }
                
                UITextField *txtFdRegion = (UITextField *)[cell viewWithTag:103];
                if (txtFdRegion) {
                    txtFdRegion.background = image;
                }
                
                UITextField *txtFdPostal = (UITextField *)[cell viewWithTag:104];
                if (txtFdPostal) {
                    txtFdPostal.background = image;
                }
                
                UITextField *txtFdCountry = (UITextField *)[cell viewWithTag:105];
                if (txtFdCountry) {
                    txtFdCountry.background = image;
                }

            }
        }
        else if (indexPath.section == 4)
        {
            id view  = [cell viewWithTag:99];
            if ([view isKindOfClass:[UITextField class]])
            {
                UITextField *txtFdOtherDetails = (UITextField *)view;
                if (txtFdOtherDetails) {
                    txtFdOtherDetails.background = image;
                }
                
            }
        }
    }
    
    cell.clipsToBounds = YES;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

#pragma mark - Tableviewcell SubView Methods

-(IBAction)btnIsSubCustomerAction:(id)sender
{
    UIButton *btnClicked = sender;
    CGPoint position = [btnClicked convertPoint:CGPointZero toView:tblViewAddCustomer];
    NSIndexPath *indexPath = [tblViewAddCustomer indexPathForRowAtPoint:position];
    
    NSMutableDictionary *mutDictData = [[mutArrAddCustomerData objectAtIndex:indexPath.section] mutableCopy];
    
    NSString *strIsSubCustomer = [mutDictData objectForKey:@"issubcustomer"];
    if ([strIsSubCustomer isEqualToString:@"0"])
        [mutDictData setObject:@"1" forKey:@"issubcustomer"];
    else
        [mutDictData setObject:@"0" forKey:@"issubcustomer"];
    
    [mutDictData setObject:@"1" forKey:@"isbillwithparent"];
    
    [mutArrAddCustomerData replaceObjectAtIndex:indexPath.section withObject:[mutDictData copy]];
    
    
    [tblViewAddCustomer reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(IBAction)btnIsBillWithParentAction:(id)sender
{
    UIButton *btnClicked = sender;
    CGPoint position = [btnClicked convertPoint:CGPointZero toView:tblViewAddCustomer];
    NSIndexPath *indexPath = [tblViewAddCustomer indexPathForRowAtPoint:position];
    
    UITableViewCell *cell = [tblViewAddCustomer cellForRowAtIndexPath:indexPath];
    if (cell)
    {
        UIButton *btnBillWithParent = (UIButton*)[cell viewWithTag:104];
        
        NSMutableDictionary *mutDictData = [[mutArrAddCustomerData objectAtIndex:0] mutableCopy];
        
        NSString *strIsBillWithParent = [mutDictData objectForKey:@"isbillwithparent"];
        if ([strIsBillWithParent isEqualToString:@"0"])
        {
            [mutDictData setObject:@"1" forKey:@"isbillwithparent"];
            
            [btnBillWithParent setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
        }
        else
        {
            [mutDictData setObject:@"0" forKey:@"isbillwithparent"];
            
            [btnBillWithParent setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
        }
        
        [mutArrAddCustomerData replaceObjectAtIndex:0 withObject:[mutDictData copy]];
        
    }
}

-(IBAction)btnAddShippingAddressAction:(id)sender
{
    UIButton *btnClicked = sender;
    CGPoint position = [btnClicked convertPoint:CGPointZero toView:tblViewAddCustomer];
    NSIndexPath *indexPath = [tblViewAddCustomer indexPathForRowAtPoint:position];
    
    UITableViewCell *cell = [tblViewAddCustomer cellForRowAtIndexPath:indexPath];
    if (cell)
    {
        UIButton *btnAddShipping = (UIButton*)[cell viewWithTag:106];
        
        NSMutableDictionary *mutDictData = [[mutArrAddCustomerData objectAtIndex:2] mutableCopy];
        
        NSString *strIsAddShippingAddress = [mutDictData objectForKey:@"addshippingaddress"];
        if ([strIsAddShippingAddress isEqualToString:@"0"])
        {
            [mutDictData setObject:@"1" forKey:@"addshippingaddress"];
            [mutArrAddCustomerData replaceObjectAtIndex:2 withObject:[mutDictData copy]];
            if (btnAddShipping)
            {
                [btnAddShipping setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
                [btnAddShipping setTitle:@"Copy billing to shipping" forState:UIControlStateNormal];
            }
            
            NSDictionary *dictData = [NSDictionary dictionaryWithObjectsAndKeys:@"cell3",@"cellidentifier",@"Shipping Address",@"header",@"",@"address1",@"",@"address2",@"",@"address3",@"",@"city",@"",@"region",@"",@"pincode",@"",@"country",nil];
            [mutArrAddCustomerData insertObject:dictData atIndex:3];
            
             [tblViewAddCustomer insertSections:[NSIndexSet indexSetWithIndex:3] withRowAnimation:UITableViewRowAnimationTop];
        }
        else
        {
            if (btnAddShipping)
            {
                NSString *strIsCopyBillingAddress = [mutDictData objectForKey:@"copyshippingaddress"];
                if ([strIsCopyBillingAddress isEqualToString:@"0"])
                {
                    [mutDictData setObject:@"1" forKey:@"copyshippingaddress"];
                    [btnAddShipping setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
                    
                     //replace all values in
                    NSMutableDictionary *mutDictShipping = [[mutArrAddCustomerData objectAtIndex:3] mutableCopy];
                    [mutDictShipping setObject:[mutDictData objectForKey:@"address1"] forKey:@"address1"];
                    [mutDictShipping setObject:[mutDictData objectForKey:@"address2"] forKey:@"address2"];
                    [mutDictShipping setObject:[mutDictData objectForKey:@"address3"] forKey:@"address3"];
                    [mutDictShipping setObject:[mutDictData objectForKey:@"city"] forKey:@"city"];
                    [mutDictShipping setObject:[mutDictData objectForKey:@"region"] forKey:@"region"];
                    [mutDictShipping setObject:[mutDictData objectForKey:@"pincode"] forKey:@"pincode"];
                    [mutDictShipping setObject:[mutDictData objectForKey:@"country"] forKey:@"country"];
                    
                    [mutArrAddCustomerData replaceObjectAtIndex:3 withObject:[mutDictShipping copy]];
                    
                    NSIndexPath *shippingIndexPath = [NSIndexPath indexPathForItem:0 inSection:3];
                    if (shippingIndexPath) {
                        [tblViewAddCustomer reloadRowsAtIndexPaths:@[shippingIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                    }
                }
                else
                {
                    [mutDictData setObject:@"0" forKey:@"copyshippingaddress"];
                    [btnAddShipping setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
                    
                }
                
                [mutArrAddCustomerData replaceObjectAtIndex:2 withObject:[mutDictData copy]];
            }
        }
    }
}


#pragma mark -
#pragma mark - UITextViewDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.background = [UIImage imageNamed:@"txtfd_bg_sel"];
    
    CGPoint txtFieldPosition = [textField convertPoint:CGPointZero toView:tblViewAddCustomer];
    
    NSIndexPath *indexPath = [tblViewAddCustomer indexPathForRowAtPoint:txtFieldPosition];
    
    if (indexPath)
    {
        [tblViewAddCustomer scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    }
    
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    textField.background = [UIImage imageNamed:@"txtfd_bg"];
    
    CGPoint txtFieldPosition = [textField convertPoint:CGPointZero toView:tblViewAddCustomer];
    NSIndexPath *indexPath = [tblViewAddCustomer indexPathForRowAtPoint:txtFieldPosition];
    
    if (indexPath)
    {
        NSMutableDictionary *mutDictData = [[mutArrAddCustomerData objectAtIndex:indexPath.section] mutableCopy];

        if (indexPath.section == 0)
        {
            if (textField.tag == 99) {
                
            }
            [mutDictData setObject:@"1" forKey:@"addshippingaddress"];
        }
        
        [mutArrAddCustomerData replaceObjectAtIndex:indexPath.section withObject:[mutDictData copy]];
        
    }
    else
    {
        
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    [textField resignFirstResponder];
    
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    //NSString *strText = [textView.text stringByAppendingString:text];
    //NSLog(@"shouldChangeTextInRange : %@ || %@",text,strText);
    
    return YES;
}

#pragma mark -
#pragma mark - UIKeyBoardNotification

- (void)keyboardDidShow:(NSNotification *)aNotification;
{
    NSDictionary* keyboardInfo = [aNotification userInfo];
    //NSLog(@"UserInfo : %@",keyboardInfo);
    NSValue* keyboardFrameEnd = [keyboardInfo valueForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardFrameEndRect = [keyboardFrameEnd CGRectValue];
    //NSLog(@"Frame : %@",NSStringFromCGRect(keyboardFrameEndRect));
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0.3f];
    CGRect rectTblView = tblViewAddCustomer.frame;
    rectTblView.size.height = self.view.frame.size.height-(rectTblView.origin.y+keyboardFrameEndRect.size.height);
    tblViewAddCustomer.frame = rectTblView;
    [UIView commitAnimations];
}

- (void)keyboardDidHide:(NSNotification *)aNotification;
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0.2f];
    CGRect rectTblView = tblViewAddCustomer.frame;
    rectTblView.size.height = self.view.frame.size.height-rectTblView.origin.y;
    tblViewAddCustomer.frame = rectTblView;
    [UIView commitAnimations];
}


@end
