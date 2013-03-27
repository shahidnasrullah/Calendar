//
//  SettingsViewController.m
//  CalendarView
//
//  Created by coeus on 22/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

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
    self.title = @"Settings";
    [self setTableViewData];
    // Do any additional setup after loading the view from its nib.
}

-(void) setTableViewData
{
    tableData = [[NSMutableArray alloc] init];
    [tableData addObject:@"Start Date"];
    [tableData addObject:@"Select Friends"];
    [tableData addObject:@"Visibility"];
}

-(UIView*) createPages: (UIColor *) color withFrame:(CGRect) frame
{
    UIView * view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = color;
    //[views addObject:views];
    return view;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate & Datasource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * identifier = @"cellIdentity";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [tableData objectAtIndex:[indexPath row]];
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch ([indexPath row]) {
        case 0:
            datePickerController = [[DatePickerViewController alloc] init];
            [self.navigationController pushViewController:datePickerController animated:YES];
            break;
        case 1:
            friendsController = [[FriendsListViewController alloc] init];
            [self.navigationController pushViewController:friendsController animated:YES];
            break;
        case 2:
            accessController = [[AccessLevelViewController alloc] init];
            [self.navigationController pushViewController:accessController animated:YES];
            break;
        default:
            break;
    }
}

@end
