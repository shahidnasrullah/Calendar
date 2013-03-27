//
//  DatePickerViewController.m
//  CalendarView
//
//  Created by coeus on 27/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import "DatePickerViewController.h"
#import "AppConstants.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Start Date";
    currentDate = [NSDate date];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_selectClicked:(id)sender {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Date" message:[NSString stringWithFormat:@"Date: %@", currentDate] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    [AppConstants setStartDate:currentDate];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)picked_valueChanged:(id)sender {
    currentDate = [(UIDatePicker *)sender date];
}
@end
