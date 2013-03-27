//
//  FriendsListViewCell.m
//  CalendarView
//
//  Created by coeus on 27/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import "FriendsListViewCell.h"

@implementation FriendsListViewCell
@synthesize isSelected = _isSelected;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) setIsSelected:(BOOL) selected
{
    _isSelected = selected;
    [self.switch_isFriend setSelected:selected];
}

- (IBAction)switch_valueChanged:(id)sender {
    self.isSelected = ((UISwitch*)sender).selected;
}
@end
