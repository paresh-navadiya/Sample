/*
 Copyright (C) 2015 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 This controller displays a table with rows. This controller demonstrates how to insert rows after the intial set of rows has been added and displayed.
 */

#import "ScheduleTableController.h"
#import "ScheduleTableRowController.h"

@interface ScheduleTableController()

@property (weak, nonatomic) IBOutlet WKInterfaceTable *interfaceTable;
@property (strong, nonatomic) NSArray *arrScheduleEvents;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *lblUserName;
@end

@implementation ScheduleTableController

- (instancetype)init {
    self = [super init];

    if (self) {
        // Initialize variables here.
        // Configure interface objects here.

    }
    
    return self;
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    
    
    NSDictionary *dictUser = (NSDictionary *)context;
    NSLog(@"\n\n\nDetails : %@",dictUser);
    
    if ([dictUser count]>0)
    {
        //set username first in title
        NSString *strUserName = [dictUser objectForKey:@"username"];
        //[self.lblUserName setText:strUserName];
        [self setTitle:strUserName];
        
        //now show header for tableview
        //[self.lblUserName setText:@"Today's schedule"];

        //intialize schedule array from data
        self.arrScheduleEvents = [dictUser objectForKey:@"data"];
        
        [self loadTableData];
    }
}

- (void)willActivate {
    // This method is called when the controller is about to be visible to the wearer.
    NSLog(@"%@ will activate", self);
}

- (void)didDeactivate {
    // This method is called when the controller is no longer visible.
    NSLog(@"%@ did deactivate", self);
}

- (void)loadTableData {
    
    [self.interfaceTable setNumberOfRows:self.arrScheduleEvents.count withRowType:@"default"];
    
    [self.arrScheduleEvents enumerateObjectsUsingBlock:^(NSDictionary *dictSchedule, NSUInteger idx, BOOL *stop) {
        ScheduleTableRowController *row = [self.interfaceTable rowControllerAtIndex:idx];
        
        
        NSString *strTempStartTime = [dictSchedule objectForKey:@"starttime"];
        NSRange startRange = [strTempStartTime rangeOfString:@":00" options:NSBackwardsSearch];
        NSString *strStartTime = [strTempStartTime substringToIndex:startRange.location];
        
        NSString *strTempEndTime = [dictSchedule objectForKey:@"endtime"];
        NSRange endRange = [strTempEndTime rangeOfString:@":00" options:NSBackwardsSearch];
        NSString *strEndTime = [strTempEndTime substringToIndex:endRange.location];
        
        NSString *strEventTime= [NSString stringWithFormat:@"%@ - %@",strStartTime,strEndTime];
        [row.lblEventTime setText:strEventTime];

        NSString *strTitle = [dictSchedule objectForKey:@"eventname"];
        [row.lblEventTitle setText:strTitle];
    }];
    
//    for (NSDictionary *dictSchedule in self.arrScheduleEvents)
//    {
//        ScheduleTableRowController *row = [self.interfaceTable rowControllerAtIndex:idx];
//        
//        NSString *strTitle = [dictSchedule objectForKey:@"eventname"];
//        [row.rowLabel setText:strTitle];
//    }
}

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex
{
    NSDictionary *dictSchedule = [self.arrScheduleEvents objectAtIndex:rowIndex];
    
    [self pushControllerWithName:@"scheduleDetailController" context:dictSchedule];
}

@end
