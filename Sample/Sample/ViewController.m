//
//  ViewController.m
//  Sample
//
//  Created by ECWIT on 09/03/15.
//  Copyright (c) 2015 ECWIT. All rights reserved.
//

#import "ViewController.h"

#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //https://github.com/JV17/YoutubePlayer
    
    tblViewList.tableFooterView = [UIView new];
    
    mutArrData = [NSMutableArray array];
    
    [mutArrData addObject:@"Form"];
    [mutArrData addObject:@"Circle Chart"];
    [mutArrData addObject:@"Create PDF"];
    [mutArrData addObject:@"HTTP Request"];
}

#pragma mark -
#pragma mark - UITableViewDataSource & Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [mutArrData count];
}



//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [cell setBackgroundColor:[UIColor clearColor]];
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *strCellidentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCellidentifier];
    
    if (cell)
    {
        NSString *strTitle = [mutArrData objectAtIndex:indexPath.row];
        UILabel *lblTitle = (UILabel *)[cell viewWithTag:99];
        lblTitle.text = strTitle;

    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *strTitle = [mutArrData objectAtIndex:indexPath.row];
    strTitle = [strTitle stringByAppendingString:@"VC"];
    strTitle = [strTitle stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    UIViewController *objUIViewController =  (UIViewController *)[self.storyboard instantiateViewControllerWithIdentifier:strTitle];
    
    [self.navigationController pushViewController:objUIViewController animated:YES];
}
@end
