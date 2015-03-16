//
//  ScheduleDetailController.m
//  Sample
//
//  Created by ECWIT on 12/03/15.
//  Copyright (c) 2015 ECWIT. All rights reserved.
//

#import "ScheduleDetailController.h"

@interface ScheduleDetailController()

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *lblEventTime;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *lblEventTitle;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *lblEventNotes;
@end

@implementation ScheduleDetailController

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
    
    
    NSDictionary *dictSchedule = (NSDictionary *)context;
    NSLog(@"\n\n\nSchedule : %@",dictSchedule);
    
    if ([dictSchedule count]>0)
    {
        @autoreleasepool {
            //set event time first
            NSString *strTempStartTime = [dictSchedule objectForKey:@"starttime"];
            NSRange startRange = [strTempStartTime rangeOfString:@":00" options:NSBackwardsSearch];
            NSString *strStartTime = [strTempStartTime substringToIndex:startRange.location];
            
            NSString *strTempEndTime = [dictSchedule objectForKey:@"endtime"];
            NSRange endRange = [strTempEndTime rangeOfString:@":00" options:NSBackwardsSearch];
            NSString *strEndTime = [strTempEndTime substringToIndex:endRange.location];
            
            NSString *strEventTime= [NSString stringWithFormat:@"Time : %@ - %@",strStartTime,strEndTime];
            
            NSMutableAttributedString* attrStrEventTime = [[NSMutableAttributedString alloc]initWithString:strEventTime];
            [attrStrEventTime addAttribute:NSForegroundColorAttributeName
                                     value:[UIColor redColor]
                                     range:NSMakeRange(0, 4)];
            
            [self.lblEventTime setAttributedText:[attrStrEventTime copy]];
            //[self.lblEventTime setText:strEventTime];
            
            //now set event name (title)
            NSString *strEventName = nil;
            
            NSArray *arrKeys = [dictSchedule allKeys];
            if ([arrKeys containsObject:@"taskid"]) //Task
            {
                strEventName = [NSString stringWithFormat:@"%@ (%@)",[dictSchedule objectForKey:@"taskname"],[dictSchedule objectForKey:@"projectname"]] ;
            }
            else //Time Tracker
            {
                strEventName = [NSString stringWithFormat:@"%@ %@",[dictSchedule objectForKey:@"eventname"],[dictSchedule objectForKey:@"CName"]] ;
            }
            
            NSString *strEventTitle = [NSString stringWithFormat:@"Title : %@",strEventName];
            
            NSMutableAttributedString* attrStrEventTitle = [[NSMutableAttributedString alloc]initWithString:strEventTitle];
            [attrStrEventTitle addAttribute:NSForegroundColorAttributeName
                                      value:[UIColor redColor]
                                      range:NSMakeRange(0, 5)];
            
            [self.lblEventTitle setAttributedText:[attrStrEventTitle copy]];
            
            //[self.lblEventTitle setText:strEventTitle];
            
            //now set event notes
            
            NSString *strEventTempNotes = nil;
            if ([arrKeys containsObject:@"meetingnotes"]) //TimeTracker
            {
                strEventTempNotes = [dictSchedule objectForKey:@"meetingnotes"];
            }
            
            if (strEventTempNotes.length == 0) {
                strEventTempNotes = @"-";
            }
            
            NSString *strEventNotes = [NSString stringWithFormat:@"Notes : %@",strEventTempNotes];
            
            NSMutableAttributedString* attrStrEventNote = [[NSMutableAttributedString alloc]initWithString:strEventNotes];
            [attrStrEventNote addAttribute:NSForegroundColorAttributeName
                                     value:[UIColor redColor]
                                     range:NSMakeRange(0, 5)];
            
            [self.lblEventNotes setAttributedText:[attrStrEventNote copy]];
            
            //[self.lblEventNotes setText:strEventNotes];
        }
       
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

@end
