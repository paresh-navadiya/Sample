//
//  InterfaceController.m
//  Sample WatchKit Extension
//
//  Created by ECWIT on 10/03/15.
//  Copyright (c) 2015 ECWIT. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceImage *animatedImage;
@property (weak, nonatomic) IBOutlet WKInterfaceButton *btnSelectUser;
@property (weak,nonatomic) IBOutlet WKInterfaceLabel *lblMessage;
@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    
    //Intialize no message so blank
    [self.lblMessage setText:@""];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

#pragma mark - Methods

- (IBAction)selectUserNameWithTextInputController {
    // Using the WKTextInputMode enum, you can specify which aspects of the Text Input Controller are shown when presented.
    [self presentTextInputControllerWithSuggestions:@[@"Paresh",@"Dr Raj", @"Girish", @"Mahesh", @"Aum"] allowedInputMode:WKTextInputModePlain completion:^(NSArray *results) {
        NSLog(@"Text Input Results: %@", results);
        
        //Intially no message
        [self.lblMessage setText:@""];
        [self showActivityIndicator:YES];
        
        NSString *strUserID = @"";
        NSString *strUserName = results[0];
        
        if ([strUserName isEqualToString:@"Paresh"])
        {
            strUserID = @"159036";
            NSLog(@"ID - %@",strUserID);
        }
        else if ([strUserName isEqualToString:@"Dr Raj"])
        {
            strUserID = @"15106";
            NSLog(@"ID - %@",strUserID);
            
        }
        else if ([strUserName isEqualToString:@"Mahesh"])
        {
            strUserID = @"9468";
            NSLog(@"ID - %@",strUserID);
        }
        else if ([strUserName isEqualToString:@"Girish"])
        {
            strUserID = @"9459";
            NSLog(@"TID - %@",strUserID);
        }
        else
        {
            strUserID = @"12098";
            NSLog(@"ID - %@",strUserID);
        }
        
        if (strUserName != nil) {
            // Sends a non-nil result to the parent iOS application.
            BOOL didOpenParent = [WKInterfaceController openParentApplication:@{@"TextInput" : strUserID} reply:^(NSDictionary *replyInfo, NSError *error) {
                //NSLog(@"Reply Info: %@", replyInfo);
                //NSLog(@"Error: %@", [error localizedDescription]);
                
                [self showActivityIndicator:NO];
                
                NSMutableDictionary *mutDictData = [NSMutableDictionary dictionaryWithDictionary:replyInfo];
                [mutDictData setObject:strUserName forKey:@"username"];
                [mutDictData setObject:@"1" forKey:@"online"];
                
                
                [self addLocalNotification:[mutDictData objectForKey:@"data"]];
                
                [self cacheDataWithDictionary:[mutDictData copy] andfileName:strUserID];
                
                [self pushControllerWithName:@"scheduleTableController" context:[mutDictData copy]];
            }];
            
            NSLog(@"Did open parent application? %i", didOpenParent);

            if (!didOpenParent) {
                [self showActivityIndicator:NO];
                
                //Provide some message
                [self.lblMessage setText:@"Didn't connect to eManager iPhone App"];
            }
        }
    }];
}

#pragma mark - Other Methods

-(void)addLocalNotification:(NSArray*)arrData
{
    NSLog(@"Data : %@",arrData);
    
    UILocalNotification *notification = [UILocalNotification new];
    if (notification)
    {
        NSDate *currentDate = [NSDate date];
        NSDate *datePlusOneMinute = [currentDate dateByAddingTimeInterval:60];
        notification.fireDate =  datePlusOneMinute;
        notification.timeZone = [NSTimeZone defaultTimeZone];
        //notification.applicationIconBadgeNumber = 1;
        notification.soundName = UILocalNotificationDefaultSoundName;
        notification.repeatInterval = 0;
        notification.alertBody = @"testing";
        
        [self handleActionWithIdentifier:@"" forLocalNotification:notification];
    }
    
}

-(void)cacheDataWithDictionary:(NSDictionary *)dictData andfileName:(NSString *)strFileName
{
    //get document directory path
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    //create file path where its to be written
    NSString *strFilepath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.out",strFileName]];
    //NSLog(@"%@",strFilepath);
    
    //check file exists before writing
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (fileManager) {
        
        //check if exists
        if ([fileManager fileExistsAtPath:strFilepath])
        {
            //exits so remove it
            if([fileManager removeItemAtPath:strFilepath error:nil])
            {
                NSLog(@"file removed");
            }
        }
       
        //write new file
        if([dictData writeToFile:strFilepath atomically:YES])
        {
            NSLog(@"file written");
        }
    }
}

-(void)showActivityIndicator:(BOOL)yesOrNo
{
    if (yesOrNo) {
        
        //unhide
        [self.animatedImage setHidden:NO];
        //clear view (make all view hidden)
        [self.btnSelectUser setHidden:YES];
        
        // Uses images in WatchKit app bundle.
        [self.animatedImage setImageNamed:@"ActInd"];
        [self.animatedImage startAnimating];
    }
    else
    {
        [self.animatedImage stopAnimating];
        
        //hide
        [self.animatedImage setHidden:YES];
        //show view content
        [self.btnSelectUser setHidden:NO];
    }
}

@end



