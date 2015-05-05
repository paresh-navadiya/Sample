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
    
    //Important Note
    
//    self.view.layer.borderWidth = 10;
//    NSLog(@"%@ : %@",NSStringFromCGRect(self.view.frame) ,NSStringFromCGRect([self.view getBorderLessFrame]));
//    self.view.layer.borderWidth = 0;
    
    JLPDFGenerator *objJLPDFGenerator = [JLPDFGenerator new];
    [objJLPDFGenerator setupPDFDocumentNamed:@"test" withSize:kSizeA4Portrait];
    
    [objJLPDFGenerator beginPDFPage];
    [objJLPDFGenerator addText:@"fewgepkggeepg wegewgewgewg wgwegwegweg wegwgwegweg wegewgweg wegewgewg wgwegweg gewgewg wegewgewg wegegewg wegwegewg wegwegeweg wegwegweg wegewgwegew gwegewgew wgwegewg wegwe gwegwegweg weg we gewgewgewgwegewgwe weg wgwe gew gwe g weg weg e g weg w eg we g we gew g we gwe g ewg  we gew  g weg we g  we gw e g weg  weg we g we g we g we g we g we g we g we g ewg we  gwe g we gew g we g we ew g we g ewg we g we gewg we  gwe gw ege  ew gew  g we gwe g we gew g weg we g ew g ew gwe g we g weg ew g ew gwe g w eg we gwe g we g e w g we gw gew g we g we gw e gew g  weg we gwe g weg" withFrame:CGRectMake(10, 10, kSizeA4Portrait.width, kSizeA4Portrait.height) withFont:[UIFont boldSystemFontOfSize:17.0f] withColor:[UIColor redColor] textAlignment:NSTextAlignmentLeft verticalAlignment:NSVerticalAlignmentTop];
    
    [objJLPDFGenerator finishPDF];
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

@end
