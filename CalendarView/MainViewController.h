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
#import "CustomActionSheet.h"


@class CalendarViewController;

@interface MainViewController : UIViewController<CVCalenderItemViewDelegate, CustomActionSheetDelegate, CVCalendarWeekViewDelegate>
{
    CVCalendarWeekView * weekView;
    CustomActionSheet * customActionSheetView;
    
}
@property (weak, nonatomic) IBOutlet UIScrollView *question_scrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *quote_scrollView;
- (IBAction)btn_monthClicked:(id)sender;

@end
