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


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //self.navigationController.navigationBar.hidden = YES;
    
    //Look at bottom of credit : https://github.com/hyperoslo/Form
    
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
//    //create circle chart
//    circleChart = [[PNCircleChart alloc] initWithFrame:CGRectMake((SCREEN_WIDTH/2.0)-100.0,(SCREEN_HEIGHT/2.0)-70.0,200.0,140.0) total:@100 current:@60 clockwise:YES];
//        
//    circleChart.backgroundColor = [UIColor clearColor];
//    
//    //1st option no stroke color but default color
//    
//    //2nd option add gradiant
//    //[circleChart setStrokeColor:[UIColor clearColor]];
//    //[circleChart setStrokeColorGradientStart:[appDelegate colorWithHexString:@"4dffaa"]];
//    
//    //3rd option no gradiant but custom color
//    //[circleChart setStrokeColor:[appDelegate colorWithHexString:@"4dffaa"]];
//    
//    [circleChart strokeChart];
//    
//    [self.view addSubview:circleChart];
//    
//    [self performSelector:@selector(reloadCircleChart) withObject:nil afterDelay:3.0f];
    
    
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
    
    tblViewAddCustomer.tableFooterView = [UIView new];
    
    mutArrAddCustomerData = [NSMutableArray array];
    
    [mutArrAddCustomerData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"cell1",@"cellidentifier",@"",@"customername",@"",@"companyname",@"",@"contact",@"0",@"issubcustomer",@"",@"subcustomer",@"0",@"isbillwithparent",nil]];
    
    [mutArrAddCustomerData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"cell2",@"cellidentifier",@"",@"phone",@"",@"mobile",@"",@"fax",@"0",@"email",nil]];
    
    [mutArrAddCustomerData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"cell3",@"cellidentifier",@"",@"address1",@"",@"address2",@"",@"address3",@"",@"city",@"",@"region",@"",@"pincode",@"",@"country",@"0",@"addshippingaddress",@"0",@"copyshippingaddress",nil]];
    
    [mutArrAddCustomerData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"cell4",@"cellidentifier",@"",@"terms",nil]];
    
    [mutArrAddCustomerData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"cell5",@"cellidentifier",@"",@"otherdetails",nil]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardWillHideNotification object:nil];
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
    return 10.0f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *tempLabel=[[UILabel alloc]init];
    [tempLabel setFrame:CGRectMake(0,0,320,10)];
    tempLabel.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.1];;
    //tempLabel.shadowColor = [UIColor whiteColor];
    //tempLabel.shadowOffset = CGSizeMake(0,1);
    tempLabel.textColor = [UIColor whiteColor]; //here you can change the text color of header.
    tempLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    //NSString *sectionName = [NSString stringWithFormat:@"   %@",[arrSponsorKeys objectAtIndex:section]];
    //tempLabel.text=sectionName;

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
        
        if (indexPath.section == 0)
        {
            //
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
        
        NSString *strIsBillWithParent = [mutDictData objectForKey:@"addshippingaddress"];
        if ([strIsBillWithParent isEqualToString:@"0"])
        {
            [mutDictData setObject:@"1" forKey:@"addshippingaddress"];
            [mutArrAddCustomerData replaceObjectAtIndex:2 withObject:[mutDictData copy]];
            
            
            
            if (btnAddShipping) {
                [btnAddShipping setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
                [btnAddShipping setTitle:@"Copy billing to shipping" forState:UIControlStateNormal];
            }
            
            NSDictionary *dictData = [NSDictionary dictionaryWithObjectsAndKeys:@"cell3",@"cellidentifier",@"",@"address1",@"",@"address2",@"",@"address3",@"",@"city",@"",@"region",@"",@"pincode",@"",@"country",nil];
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

- (BOOL)textFieldShouldBeginEditing:(UITextView *)textField
{
    CGPoint txtFieldPosition = [textField convertPoint:CGPointZero toView:tblViewAddCustomer];
    
    NSIndexPath *indexPath = [tblViewAddCustomer indexPathForRowAtPoint:txtFieldPosition];
    
    if (indexPath)
    {
        UITableViewCell *cell = [tblViewAddCustomer cellForRowAtIndexPath:indexPath];
        if (cell)
        {
            UIImageView *imgView = (UIImageView*)[cell viewWithTag:98];
            imgView.image = [UIImage imageNamed:@"txtfd_bg_sel"];
        }
        
         [tblViewAddCustomer scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    }
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextView *)textField
{
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
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
        
        CGPoint txtFieldPosition = [textField convertPoint:CGPointZero toView:tblViewAddCustomer];
        
        NSIndexPath *indexPath = [tblViewAddCustomer indexPathForRowAtPoint:txtFieldPosition];
        
        if (indexPath)
        {
            UITableViewCell *cell = [tblViewAddCustomer cellForRowAtIndexPath:indexPath];
            if (cell)
            {
                UIImageView *imgView = (UIImageView*)[cell viewWithTag:98];
                imgView.image = [UIImage imageNamed:@"txtfd_bg"];
            }
            
            [tblViewAddCustomer scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
        }

    }
   
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    [textField resignFirstResponder];
    
    return YES;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    //NSString *strText = [textView.text stringByAppendingString:text];
    //NSLog(@"shouldChangeTextInRange : %@ || %@",text,strText);
    
    return YES;
}
- (void)textViewDidChange:(UITextView *)textView
{
    
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
