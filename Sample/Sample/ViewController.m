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
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleDoubleTap:)];
    tapGesture.numberOfTapsRequired = 2;
    
    [self.view addGestureRecognizer:tapGesture];
    
    //intially it will be NO we want to be also NO as navigation bar is visible
    isBarHidden = NO;
    
//    self.view.layer.borderWidth = 10;
//    NSLog(@"%@ : %@",NSStringFromCGRect(self.view.frame) ,NSStringFromCGRect([self.view getBorderLessFrame]));
//    self.view.layer.borderWidth = 0;
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

@end
