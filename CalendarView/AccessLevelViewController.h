//
//  AccessLevelViewController.h
//  CalendarView
//
//  Created by coeus on 27/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppConstants.h"

@interface AccessLevelViewController : UIViewController<UIGestureRecognizerDelegate>
{
    FRIENDS_ACCESS_LEVEL access_level;
    bool isAnySwitchSelected;
}
- (IBAction)btn_saveSettingsClicked:(id)sender;

- (IBAction)btn_allClicked:(id)sender;
- (IBAction)btn_someClicked:(id)sender;
- (IBAction)btn_noClicked:(id)sender;

@end
