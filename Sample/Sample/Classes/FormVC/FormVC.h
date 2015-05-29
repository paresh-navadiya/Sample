//
//  ViewController.h
//  Sample
//
//  Created by ECWIT on 09/03/15.
//  Copyright (c) 2015 ECWIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"
#import "PNCircleChart.h"
#import "VAProgressCircle.h"

@interface FormVC : UIViewController <UIWebViewDelegate,UITextFieldDelegate>
{
    __weak IBOutlet UITableView *tblViewAddCustomer;
    
    PNCircleChart *circleChart;
    //
    VAProgressCircle *progressChart;
    int circleProgress;
    NSTimer *randomTimer;
    
    //
    BOOL isBarHidden;
    
    NSMutableArray *mutArrAddCustomerData;
}

//tableviewcell subview methods
-(IBAction)btnIsSubCustomerAction:(id)sender;
-(IBAction)btnIsBillWithParentAction:(id)sender;

-(IBAction)btnAddShippingAddressAction:(id)sender;
@end

