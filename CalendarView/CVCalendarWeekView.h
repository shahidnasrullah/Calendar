//
//  CVCalendarWeekView.h
//  CalendarView
//
//  Created by coeus on 13/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AppConstants.h"
#import "CVCalenderItemView.h"
#import "SmiliesView.h"

typedef enum
{
    ANIMATION_DIRECTION_NONE = 0,
    ANIMATION_DIRECTION_LEFT,
    ANIMATION_DIRECTION_RIGHT
    
} ANIMATION_DIRECTION;

@interface CVCalendarWeekView : UIView <CVCalenderItemViewDelegate, UIGestureRecognizerDelegate, SmiliesViewDelegate>
{
    NSCalendar * cal;
    NSDateComponents * components;
    NSMutableArray * calenderItems;
    int firstDayOfWeek;
    ANIMATION_DIRECTION anim_direction;
}

@property (weak, nonatomic) IBOutlet UILabel *lbl_title;

-(void) createCalenderViewItems:(NSDate *) date;
- (IBAction)leftArrowClicked:(id)sender;
- (IBAction)rightArrowClicked:(id)sender;
@end
