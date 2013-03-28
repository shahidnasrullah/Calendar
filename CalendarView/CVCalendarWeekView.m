//
//  CVCalendarWeekView.m
//  CalendarView
//
//  Created by coeus on 13/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import "CVCalendarWeekView.h"

@implementation CVCalendarWeekView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(NSInteger) numberOfDayInWeek :(NSDate*) date
{
    NSDate * today = date;
    cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    components = [cal components:( NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit| NSDayCalendarUnit ) fromDate:today];
    
    return [components weekday];
}

-(NSString*) getMonthName
{
    NSDateFormatter * form = [[NSDateFormatter alloc] init];
    [form setDateFormat:@"MMM"];
    NSString * monthName = [form stringFromDate: [cal dateFromComponents:components]];
    
    return monthName;
}

-(void) createDaysView
{
    daysView = [[CVDaysView alloc] initWithFrame:CGRectMake(0, 35, 320, 25)];
    [self addSubview:daysView];
}

-(NSString*) getNextMonthName:(NSDate*) date
{
    NSDateFormatter * form = [[NSDateFormatter alloc] init];
    [form setDateFormat:@"MMM"];
    NSDateComponents * dateComponents;
    dateComponents = [cal components:( NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit| NSDayCalendarUnit ) fromDate:date];
    [dateComponents setDay:1];
    if([dateComponents month] +1>12){
        [dateComponents setMonth:1];
        [dateComponents setYear:[dateComponents year]+1];
    }
    else
    {
        [dateComponents setMonth:[dateComponents month]+1];
    }
    NSDate * newDate = [cal dateFromComponents:dateComponents];
    NSString * monthName = [form stringFromDate: newDate];
    
    return monthName;
}

-(void) createCalenderViewItems:(NSDate *) date
{
    int xOffsetForword = 0, yOffsetForword = 60;
    if(!calenderItems){
        calenderItems = [[NSMutableArray alloc] init];
    }
    int numberOfDayInWeek = [self numberOfDayInWeek:date];
    int numberOfMonthInYear = [components month]-1;
    int numberOfDayInMonth = [components day];
    firstDayOfWeek = numberOfDayInMonth - numberOfDayInWeek + 1;
    int currentDayToShow = firstDayOfWeek;
    if(currentDayToShow <0)
    {
        currentDayToShow = [[MONTH_DAYS objectAtIndex:numberOfMonthInYear] intValue] + currentDayToShow;
    }
    int totalDaysInCurrentMonth = [[MONTH_DAYS objectAtIndex:numberOfMonthInYear] intValue];
    // For Leap Year
    if((2012 - [components year])%4 == 0)
    {
        totalDaysInCurrentMonth++;
    }
    
    // Set up Title Label
    NSString * monthName = [self getMonthName];
    
    
    int dayIncrement = 0;
    for (int i=0; i<7; i++) {
        CVCalenderItemView * item;
        
        if([calenderItems count]<i+1)
        {
            // Item does not exist so create one
            NSArray * nibsArray = [[NSBundle mainBundle] loadNibNamed:@"CVCalenderItem" owner:nil options:nil];
            item = [nibsArray objectAtIndex:0];
            [item addTapGestureRecognizer];
            [calenderItems addObject:item];
            [self addSubview:item];
            item.delegate = self;
        }
        else
        {
            item = [calenderItems objectAtIndex:i];
        }
        
        
        if(anim_direction == ANIMATION_DIRECTION_LEFT)
        {
            [UIView animateWithDuration: (0.35 - i * 0.05)  delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                [item setFrame:CGRectMake(320, yOffsetForword, CALENDER_WIDTH/7 +1, item.frame.size.height)];
            } completion:^(BOOL finished) {
                [item setFrame:CGRectMake(-CALENDER_WIDTH/7 +1, yOffsetForword, CALENDER_WIDTH/7 +1, item.frame.size.height)];
                
                [UIView animateWithDuration:(i +1) * 0.05 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    [item setFrame:CGRectMake(xOffsetForword, yOffsetForword, CALENDER_WIDTH/7 +1, item.frame.size.height)];
                } completion:^(BOOL finished) {
                    
                }];
            }];
        }
        else if(anim_direction == ANIMATION_DIRECTION_RIGHT)
        {
            [UIView animateWithDuration: (i +1) * 0.05  delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                [item setFrame:CGRectMake(-CALENDER_WIDTH/7 +1, yOffsetForword, CALENDER_WIDTH/7 +1, item.frame.size.height)];
            } completion:^(BOOL finished) {
                [item setFrame:CGRectMake(320, yOffsetForword, CALENDER_WIDTH/7 +1, item.frame.size.height)];
                
                [UIView animateWithDuration:(0.35 - i * 0.05) delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    [item setFrame:CGRectMake(xOffsetForword, yOffsetForword, CALENDER_WIDTH/7 +1, item.frame.size.height)];
                } completion:^(BOOL finished) {
                    
                }];
            }];
        }
        else
        {
            [item setFrame:CGRectMake(xOffsetForword, yOffsetForword, CALENDER_WIDTH/7 +1, item.frame.size.height)];
        }
        
        if(currentDayToShow + dayIncrement > totalDaysInCurrentMonth)
        {
            dayIncrement = 0;
            currentDayToShow = 1;
            
            NSDate * currentdate = [cal dateFromComponents:components];
            NSString * nextMonthName = [self getNextMonthName:currentdate];
            //NSLog(@"Next Month Name: %@", nextMonthName);
            monthName = [monthName stringByAppendingFormat:@"/%@",nextMonthName];
        }
        item.lbl_date.text = [NSString stringWithFormat:@"%d",currentDayToShow + dayIncrement++];
        
        
        
        
        [item addTapGestureRecognizer];
        [item setTag:i+1];
        
        xOffsetForword += item.frame.size.width;
    }
    self.lbl_title.text = [NSString stringWithFormat:@"%@ %d",monthName, [components year]];
    
}


- (void)leftArrowClicked:(id)sender {
    anim_direction = ANIMATION_DIRECTION_LEFT;
    int firstDayOfPreviousWeek = firstDayOfWeek - 7;
    if(firstDayOfPreviousWeek < 0)
    {
        
        int currentMonth = [components month] -2;
        int previousMonthTotalDays;
        if(currentMonth < 0)
        {
            currentMonth = 11;
            previousMonthTotalDays = [[MONTH_DAYS objectAtIndex:currentMonth] intValue];
            firstDayOfPreviousWeek = previousMonthTotalDays + firstDayOfPreviousWeek;
            [components setMonth:12];
            [components setYear:[components year] - 1];
        }
        else
        {
            previousMonthTotalDays = [[MONTH_DAYS objectAtIndex:currentMonth] intValue];
            if((2012 -[components year])%4 == 0)
            {
                // Leap Year
                previousMonthTotalDays++;
            }
            firstDayOfPreviousWeek = previousMonthTotalDays + firstDayOfPreviousWeek;
            [components setMonth:[components month] - 1];
        }
    }
    [components setDay:firstDayOfPreviousWeek];
    [components setHour:1];
    
    NSDate * date = [cal dateFromComponents:components];
    [self createCalenderViewItems:date];
}

- (void)rightArrowClicked:(id)sender {
    anim_direction = ANIMATION_DIRECTION_RIGHT;
    int firstDayOfNextWeek = firstDayOfWeek + 7;
    if(firstDayOfNextWeek > [[MONTH_DAYS objectAtIndex:[components month]-1] intValue])
    {
        int currentMonth = [components month]-1;

        int currentMonthTotalDays = [[MONTH_DAYS objectAtIndex:currentMonth] intValue];
        if(currentMonth == 1)
        {
            int year = [components year];
            if((2012 - year)%4 == 0)
            {
                // Leap Year
                currentMonthTotalDays++;
            }
        }
        
        firstDayOfNextWeek = firstDayOfNextWeek - currentMonthTotalDays;
        [components setMonth:[components month]+1];
    }
    [components setDay:firstDayOfNextWeek];
    [components setHour:1];
    
    NSDate * date = [cal dateFromComponents:components];
    [self createCalenderViewItems:date];
}

#pragma mark - CVCalenderItemView Delegate

-(void)CVcalenderItemView:(CVCalenderItemView *)itemView didLongPressedWithGesture:(UILongPressGestureRecognizer *)longPressedGesture withDate:(NSDate *)date
{
    if([self.delegate respondsToSelector:@selector(CVcalenderItemView:didLongPressedWithGesture:withDate:)])
    {
        [self.delegate CVcalenderItemView:itemView didLongPressedWithGesture:longPressedGesture withDate:date];
    }
}

-(void)CVCalenderItemView:(CVCalenderItemView *)itemView didClickedOnGesture:(UITapGestureRecognizer *)recognizer withTag:(NSInteger)tag withDate:(NSDate *)date
{
    if([self.delegate respondsToSelector:@selector(CVCalenderItemView:didClickedOnGesture:withTag:withDate:)])
    {
        [self.delegate CVCalenderItemView:itemView didClickedOnGesture:recognizer withTag:tag withDate:date];
    }
}



@end
