//
//  AppDelegate.h
//  Sample
//
//  Created by ECWIT on 09/03/15.
//  Copyright (c) 2015 ECWIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

-(UIColor *)colorWithHexString:(NSString *)hexString;

-(BOOL)checkInternetConnection;
@end

