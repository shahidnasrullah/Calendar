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
#import "CVDaysView.h"

typedef enum
{
    ANIMATION_DIRECTION_NONE = 0,
    ANIMATION_DIRECTION_LEFT,
    ANIMATION_DIRECTION_RIGHT
    
} ANIMATION_DIRECTION;

@protocol CVCalendarWeekViewDelegate <NSObject>

// When Long pressed on calender item
-(void)CVcalenderItemView:(CVCalenderItemView *)itemView didLongPressedWithGesture:(UILongPressGestureRecognizer *)longPressedGesture withDate:(NSDate *)date;
// When Clicked on calendar item
-(void)CVCalenderItemView:(CVCalenderItemView *)itemView didClickedOnGesture:(UITapGestureRecognizer *)recognizer withTag:(NSInteger)tag withDate:(NSDate *)date;

@end

@interface CVCalendarWeekView : UIView <CVCalenderItemViewDelegate, UIGestureRecognizerDelegate, SmiliesViewDelegate>
{
    NSCalendar * cal;
    NSDateComponents * components;
    NSMutableArray * calenderItems;
    int firstDayOfWeek;
    ANIMATION_DIRECTION anim_direction;
    CVDaysView * daysView;
}

@property (weak, nonatomic) IBOutlet UILabel *lbl_title;
@property (nonatomic, retain) id delegate;

-(void) createCalenderViewItems:(NSDate *) date;
-(void) createDaysView;
- (IBAction)leftArrowClicked:(id)sender;
- (IBAction)rightArrowClicked:(id)sender;
@end

