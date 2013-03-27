//
//  SettingsViewController.h
//  CalendarView
//
//  Created by coeus on 22/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatePickerViewController.h"
#import "FriendsListViewController.h"
#import "AccessLevelViewController.h"

@interface SettingsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray * tableData;
    DatePickerViewController * datePickerController;
    FriendsListViewController * friendsController;
    AccessLevelViewController * accessController;
}
@property (weak, nonatomic) IBOutlet UITableView *table;



@end
