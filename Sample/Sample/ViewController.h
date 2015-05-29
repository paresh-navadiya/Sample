//
//  ViewController.h
//  Sample
//
//  Created by ECWIT on 09/03/15.
//  Copyright (c) 2015 ECWIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"

@interface ViewController : UIViewController <UIWebViewDelegate,UITextFieldDelegate>
{
    __weak IBOutlet UITableView *tblViewList;
    
    NSMutableArray *mutArrData;
}
@end

