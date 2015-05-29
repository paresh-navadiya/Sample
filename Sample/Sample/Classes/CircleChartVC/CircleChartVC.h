//
//  CircleChartVC.h
//  Sample
//
//  Created by ECWIT on 29/05/15.
//  Copyright (c) 2015 ECWIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"
#import "PNCircleChart.h"
#import "VAProgressCircle.h"

@interface CircleChartVC : UIViewController
{
    PNCircleChart *circleChart;
    //
    VAProgressCircle *progressChart;
    int circleProgress;
    NSTimer *randomTimer;
}
@end
