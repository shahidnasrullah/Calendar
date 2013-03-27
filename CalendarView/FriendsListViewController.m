//
//  FriendsListViewController.m
//  CalendarView
//
//  Created by coeus on 27/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import "FriendsListViewController.h"
#import "FriendsListViewCell.h"

@interface FriendsListViewController ()

@end

@implementation FriendsListViewController

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
    self.title = @"Select Friends";
    [self addStaticTableData];
    // Do any additional setup after loading the view from its nib.
}

-(void) addStaticTableData
{
    tableData = [[NSMutableArray alloc] init];
    [tableData addObject:@{@"firstName" : @"Shahid",@"lastName": @"Nasrullah"}];
    [tableData addObject:@{@"firstName" : @"Fahad",@"lastName": @"Nasrullah"}];
    [tableData addObject:@{@"firstName" : @"Shakil",@"lastName": @"Nasrullah"}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableView Delegate & Datasource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * identifier = @"cellIdentifier";
    FriendsListViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell)
    {
        NSArray * nibsArray = [[NSBundle mainBundle] loadNibNamed:@"FriendsListViewCell" owner:nil options:nil];
        cell = [nibsArray objectAtIndex:0];
    }
    
    cell.imageView.image = [UIImage imageNamed:@"Default.png"];
    NSDictionary * dict = [tableData objectAtIndex:[indexPath row]];
    cell.lbl_firstName.text = [dict objectForKey:@"firstName"];
    cell.lbl_lastName.text = [dict objectForKey:@"lastName"];
    cell.isSelected = NO;
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
