//
//  FriendsListViewController.h
//  CalendarView
//
//  Created by coeus on 27/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendsListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray * tableData;
}

@end
