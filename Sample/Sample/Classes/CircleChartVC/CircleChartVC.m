//
//  CircleChartVC.m
//  Sample
//
//  Created by ECWIT on 29/05/15.
//  Copyright (c) 2015 ECWIT. All rights reserved.
//

#import "CircleChartVC.h"

@interface CircleChartVC ()

@end

@implementation CircleChartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Circle Chart";
    
    //create PNCircleChart type circle chart //(SCREEN_HEIGHT/2.0)-70.0
    circleChart = [[PNCircleChart alloc] initWithFrame:CGRectMake((SCREEN_WIDTH/2.0)-100.0,90.0,200.0,140.0) total:@100 current:@60 clockwise:YES];
    
    circleChart.backgroundColor = [UIColor clearColor];
    
    //1st option no stroke color but default color
    
    //2nd option add gradiant
    //[circleChart setStrokeColor:[UIColor clearColor]];
    //[circleChart setStrokeColorGradientStart:[appDelegate colorWithHexString:@"4dffaa"]];
    
    //3rd option no gradiant but custom color
    //[circleChart setStrokeColor:[appDelegate colorWithHexString:@"4dffaa"]];
    
    [circleChart strokeChart];
    
    [self.view addSubview:circleChart];
    
    [self performSelector:@selector(reloadCircleChart) withObject:nil afterDelay:3.0f];
    
    //add VAProgressCircle
    [self addChart];

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(resetChart) object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    NSLog(@"%@ is being deallocated",NSStringFromClass([self class]));
}


#pragma mark -
#pragma mark - PNCircleChart

-(void)reloadCircleChart
{
    [circleChart updateChartByCurrent:@00 byTotal:@100];
    [circleChart updateChartByCurrent:@60 byTotal:@100];
    
    [self performSelector:@selector(reloadCircleChart) withObject:nil afterDelay:3.0f];
}


#pragma mark -
#pragma mark -  Add VAProgressCircle
- (void)addChart
{
    UIColor *lightGreen = [UIColor colorWithRed:77.0 / 255.0 green:186.0 / 255.0 blue:122.0 / 255.0 alpha:1.0f];
    
    progressChart = [[VAProgressCircle alloc] initWithFrame:CGRectMake((SCREEN_WIDTH/2.0)-100.0, 340, 200, 200)];
    [progressChart setColor:lightGreen withHighlightColor:lightGreen];
    [progressChart setTransitionColor:lightGreen withHighlightTransitionColor:lightGreen];
    progressChart.transitionType = VAProgressCircleColorTransitionTypeGradual;
    [self.view addSubview:progressChart];
    
    randomTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(randomIncrement) userInfo:nil repeats:YES];
}

- (void)resetChart
{
    circleProgress = 0;
    
    if([randomTimer isValid])
    {
        [randomTimer invalidate];
    }
    
    [progressChart removeFromSuperview];
    progressChart = nil;
    
    [self addChart];
}

- (void)randomIncrement
{
    if(arc4random() % 2 == 1)
    {
        [self addProgress];
    }
}

- (void)addProgress
{
    int randomIncrement = circleProgress + arc4random_uniform(101 - circleProgress) / 3;
    
    if(circleProgress != randomIncrement && randomIncrement > circleProgress)
    {
        circleProgress = randomIncrement;
        [progressChart setProgress:circleProgress];
    }
    else
    {
        circleProgress++;
        [progressChart setProgress:circleProgress];
    }
    
    if (circleProgress == 100) {
        NSLog(@"reset here");
        
        //[self resetChart];
        [self performSelector:@selector(resetChart) withObject:nil afterDelay:4.0f];
    }
}

@end
