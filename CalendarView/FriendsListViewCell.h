//
//  FriendsListViewCell.h
//  CalendarView
//
//  Created by coeus on 27/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendsListViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *lbl_firstName;

@property (weak, nonatomic) IBOutlet UILabel *lbl_lastName;
@property (nonatomic) BOOL isSelected;

- (IBAction)switch_valueChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *switch_isFriend;


@end
