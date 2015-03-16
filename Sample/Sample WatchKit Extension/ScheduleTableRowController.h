/*
 Copyright (C) 2015 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 This is the row controller for the default row type in the table of the table detail controller.
 */

@import WatchKit;

@interface ScheduleTableRowController : NSObject

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *lblEventTime;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *lblEventTitle;

@end
