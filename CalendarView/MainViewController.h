//
//  NextViewController.h
//  CalendarView
//
//  Created by coeus on 12/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CVCalendarWeekView.h"
#import "SmiliesView.h"
#import "CVCalenderItemView.h"


@class CalendarViewController;

@interface MainViewController : UIViewController<CVCalenderItemViewDelegate, SmiliesViewDelegate>
{
    CVCalendarWeekView * weekView;
    SmiliesView * smiliesView;
}

@end
