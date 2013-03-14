//
//  NextViewController.m
//  CalendarView
//
//  Created by coeus on 12/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) addWeekView
{
    NSArray * nibsArray = [[NSBundle mainBundle] loadNibNamed:@"CVCalendarWeekView" owner:nil options:nil];
    weekView = [nibsArray objectAtIndex:0];
    
    [self.view addSubview:weekView];
    [weekView setFrame:CGRectMake(0, self.view.frame.size.height/2 - 50 , self.view.frame.size.width, 150)];
    [weekView createCalenderViewItems:[NSDate date]];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Next";
    [self addWeekView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
