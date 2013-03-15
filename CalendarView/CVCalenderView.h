//
//  CVCalenderView.h
//  CalendarView
//
//  Created by coeus on 11/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CVTitleView.h"
#import "CVDaysView.h"
#import "CVCalenderItemView.h"
#import "AppConstants.h"
#import <QuartzCore/QuartzCore.h>
#import "SmiliesView.h"

@interface CVCalenderView : UIView <CVtitleViewDelegate, CVCalenderItemViewDelegate, SmiliesViewDelegate>
{
    CVTitleView * titleView;
    CVDaysView * daysView;
    UIView * itemsView;
    UIView * cropedView;
    NSCalendar *cal;
    NSMutableArray * calenderItems;
    NSDateComponents *components;
    SmiliesView * smiliesView;
}


@end
