//
//  ViewController.m
//  CalendarView
//
//  Created by coeus on 11/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import "CalendarViewController.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Calendar";
    calenderView = [[CVCalenderView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:calenderView];
    [self addRightNavButton];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void) addRightNavButton
{
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(rightBarButtonItemClickecd:)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

-(void)rightBarButtonItemClickecd:(id)sender
{
    MainViewController * mainViewController = [[MainViewController alloc] init];
    [self.navigationController pushViewController:mainViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
