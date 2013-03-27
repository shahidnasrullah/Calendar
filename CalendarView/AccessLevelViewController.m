//
//  AccessLevelViewController.m
//  CalendarView
//
//  Created by coeus on 27/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import "AccessLevelViewController.h"


@interface AccessLevelViewController ()

@end

@implementation AccessLevelViewController

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
    self.title = @"Visibility";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_saveSettingsClicked:(id)sender {
    if(isAnySwitchSelected)
    {
        NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
        NSLog(@"Access Level:%d",access_level);
        [defaults setInteger:access_level forKey:kFriendsAccessLevel];
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Saved" message:@"Settings saved successfully." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        NSLog(@"Please select at least one switch");
    }
}

- (IBAction)btn_allClicked:(id)sender {
    if([(UISwitch*)sender isOn])
    {
        access_level = FRIENDS_ACCESS_LEVEL_ALL;
        isAnySwitchSelected = YES;
    }
    else
    {
        isAnySwitchSelected = NO;
    }
}

- (IBAction)btn_someClicked:(id)sender {
    if([(UISwitch*)sender isOn])
    {
        access_level = FRIENDS_ACCESS_LEVEL_SOME;
        isAnySwitchSelected = YES;
    }
    else
    {
        isAnySwitchSelected = NO;
    }
}

- (IBAction)btn_noClicked:(id)sender {
    if([(UISwitch*)sender isOn])
    {
        access_level = FRIENDS_ACCESS_LEVEL_NO;
        isAnySwitchSelected = YES;
    }
    else
    {
        isAnySwitchSelected = NO;
    }
}

@end
