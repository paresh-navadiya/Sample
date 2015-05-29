//
//  CreatePDFVC.m
//  Sample
//
//  Created by ECWIT on 29/05/15.
//  Copyright (c) 2015 ECWIT. All rights reserved.
//

#import "CreatePDFVC.h"

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

@interface CreatePDFVC ()

@end

@implementation CreatePDFVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Creat PDF";
    
    self.view.layer.borderWidth = 10;
    NSLog(@"%@ : %@",NSStringFromCGRect(self.view.frame) ,NSStringFromCGRect([self.view getBorderLessFrame]));
    self.view.layer.borderWidth = 0;
    
    JLPDFGenerator *objJLPDFGenerator = [JLPDFGenerator new];
    [objJLPDFGenerator setupPDFDocumentNamed:@"test" withSize:kSizeA4Portrait];
    
    [objJLPDFGenerator beginPDFPage];
    [objJLPDFGenerator addText:@"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.  Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda." withFrame:CGRectMake(10, 10, kSizeA4Portrait.width, kSizeA4Portrait.height) withFont:[UIFont boldSystemFontOfSize:17.0f] withColor:[UIColor redColor] textAlignment:NSTextAlignmentLeft verticalAlignment:NSVerticalAlignmentTop];
    
    [objJLPDFGenerator addLineFromPoint:CGPointMake(20, 300) toEndPoint:CGPointMake(3000, 300) withColor:[UIColor redColor] andWidth:1.0f];
    [objJLPDFGenerator finishPDF];
    
    NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    documentsDirectoryURL =  [documentsDirectoryURL URLByAppendingPathComponent:@"test.pdf"];
    
    [webPDFView loadRequest:[NSURLRequest requestWithURL:documentsDirectoryURL]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    NSLog(@"%@ is being deallocated",NSStringFromClass([self class]));
}


@end
