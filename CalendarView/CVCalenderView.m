//
//  CVCalenderView.m
//  CalendarView
//
//  Created by coeus on 11/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import "CVCalenderView.h"
#import "SmileyListViewController.h"
#import "AppConstants.h"

@implementation CVCalenderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        calenderItems = [[NSMutableArray alloc] init];
        [self createTopView];
        [self createDaysViews];
        [self createCalenderViewItems:[AppConstants getStartDate]];
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



-(void) calculateCurrentDay
{
    if(!components)
    {
        NSDate * today = [NSDate date];
        NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        
        components = [cal components:( NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit| NSDayCalendarUnit ) fromDate:today];
        NSLog(@"Day: %d", [components day]);
        components.day = 1;
        NSDateFormatter * formater = [[NSDateFormatter alloc] init];
        [formater setDateFormat:@"yyyy-MM-dd"];
        
        NSDate * d = [formater dateFromString:[NSString stringWithFormat: @"%d-%d-%d",[components year], [components month], 1]];
        NSLog(@"Date formated: %@",d);
        NSDateFormatter * form = [[NSDateFormatter alloc] init];
        [form setDateFormat:@"EE"];
        NSString * day = [form stringFromDate:d];
        NSLog(@"Week Day: %@", day);
        NSLog(@"Number of day in week: %d", [components weekday]);
        //[self createCalenderViewItems];
    }
    
}

-(NSString*) getMonthName
{
    NSDateFormatter * form = [[NSDateFormatter alloc] init];
    [form setDateFormat:@"MMMM"];
    NSString * monthName = [form stringFromDate: [cal dateFromComponents:components]];
    
    return monthName;
}

-(NSDate*) getCurrentDate:(NSDate*)date forDay:(NSInteger) day
{
    NSDateComponents * dateComponents = [cal components:( NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit| NSDayCalendarUnit ) fromDate:date];
    [dateComponents setDay:day];
    [dateComponents setHour:1];
    return [cal dateFromComponents:dateComponents];
}


-(void) createCalenderViewItems:(NSDate *) date
{
    int xOffsetForword = 0, yOffsetForword = 0;
    if(!itemsView && !cropedView){
        itemsView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 420)];
        cropedView = [[UIView alloc] initWithFrame:CGRectMake(0, TOP_VIEW_HEIGHT + DAYS_VIEW_HEIGHT, 320, 420)];
        [cropedView addSubview:itemsView];
        [self addSubview:cropedView];
    }
    
    int numberOfDayInWeek = [self numberOfDayInWeek:date];
    int numberOfDayInMonth = [components day];
    int firstDayOfMonthInWeek = numberOfDayInWeek - (numberOfDayInMonth % 7);
    if(firstDayOfMonthInWeek <0)
    {
        firstDayOfMonthInWeek = 7+ firstDayOfMonthInWeek;
    }
    int numberOfMonthInYear = [components month]-1;
    xOffsetForword = (firstDayOfMonthInWeek) * CALENDER_WIDTH/7;
    
    // Set up Title Label
    NSString * monthName = [self getMonthName];
    titleView.title.text = [NSString stringWithFormat:@"%@ %d",monthName, [components year]];
    
    int totalNumberOfDaysInCurrentMonth = [[MONTH_DAYS objectAtIndex:numberOfMonthInYear] intValue];
    // For Leap Year
    if(numberOfMonthInYear == 1)
    {
        int year = 2012 - [components year];
        if(year % 4 == 0)
        {
            totalNumberOfDaysInCurrentMonth++;
        }
    }
    for (int i=0; i<totalNumberOfDaysInCurrentMonth; i++) {
        CVCalenderItemView * item;
        if([calenderItems count]<i+1)
        {
            // Item does not exist so create one
            NSArray * nibsArray = [[NSBundle mainBundle] loadNibNamed:@"CVCalenderItem" owner:nil options:nil];
            item = [nibsArray objectAtIndex:0];
            [calenderItems addObject:item];
            [itemsView addSubview:item];
            item.delegate = self;
        }
        else
        {
            item = [calenderItems objectAtIndex:i];
        }
        
        [UIView animateWithDuration:0.6 delay:i* 0.01 options:UIViewAnimationOptionCurveEaseIn animations:^{
            [item setFrame:CGRectMake(xOffsetForword, yOffsetForword, CALENDER_WIDTH/7 +1, item.frame.size.height)];
        } completion:^(BOOL finished) {
            
        }];
        
        
        item.lbl_date.text = [NSString stringWithFormat:@"%d",i+1];
        item.pic_smiley.image =  [UIImage imageNamed:@"images.jpeg"];
        [item addTapGestureRecognizer];
        NSDate * tempDate = [cal dateFromComponents:components];
        NSDate * dateForCurrentItem = [self getCurrentDate: tempDate forDay:i+1];
        [item setTag:i+1];
        //NSLog(@"Date for current Item: %@", dateForCurrentItem);
        item.currentDate = dateForCurrentItem;
        
        
        xOffsetForword += item.frame.size.width;
        if (xOffsetForword>=320) {
            xOffsetForword = 0;
            yOffsetForword += item.frame.size.height;
        }
    }
    
    // remove extra items
    int totalItemsToShow = totalNumberOfDaysInCurrentMonth;
    int totalItemsAvailable = [calenderItems count];
    for (int j= totalItemsToShow; j<totalItemsAvailable; j++) {
        CVCalenderItemView * item = [calenderItems objectAtIndex:totalItemsToShow];
        [item removeFromSuperview];
        [calenderItems removeObjectAtIndex:totalItemsToShow];
    }
}


-(void) createDaysViews
{
    daysView = [[CVDaysView alloc] initWithFrame:CGRectMake(0, TOP_VIEW_HEIGHT, CALENDER_WIDTH, DAYS_VIEW_HEIGHT)];
    [self addSubview:daysView];
}

-(void) createTopView
{
    NSArray * nibsArray = [[NSBundle mainBundle] loadNibNamed:@"CVTitleView" owner:nil options:nil];
    titleView = [nibsArray objectAtIndex:0];
    titleView.delegate = self;
    //titleView.backgroundColor = [UIColor greenColor];
    [self addSubview:titleView];
    [titleView addGestureToLeftArrow];
    [titleView addGestureToRightArrow];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMMM"];
    NSString *stringFromDate = [formatter stringFromDate:[NSDate date]];
    titleView.title.text = [NSString stringWithFormat:@"%@ %d",stringFromDate, [components year]];
}

#pragma mark - CVTitleViewDelegate

-(void)leftArrowClicked:(UITapGestureRecognizer *)recognizer
{
    
    [components setDay:1];
    [components setHour:1];
    if([components month]-1 < 0)
    {
        [components setMonth:12];
        [components setYear:[components year] - 1];
    }
    else
    {
        [components setMonth:[components month] - 1];
    }
    NSDate * date = [cal dateFromComponents:components];
    [self createCalenderViewItems:date];
}

-(void)rightArrowClicked:(UITapGestureRecognizer *)recognizer
{
    [components setDay:1];
    [components setHour:1];
    if([components month]+1 >12)
    {
        [components setMonth:1];
        [components setYear:[components year] +1];
    }
    else
    {
        [components setMonth:[components month]+1];
    }
    NSDate * date = [cal dateFromComponents:components];
    [self createCalenderViewItems:date];
}

#pragma mark CVCalenderItemView Delegate

-(void)CVCalenderItemView:(CVCalenderItemView *)itemView didClickedOnGesture:(UITapGestureRecognizer *)recognizer withTag:(NSInteger)tag withDate:(NSDate *)date
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Title" message:[NSString stringWithFormat: @"Item Clicked with tag : %d with Date: %@", tag, date] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    itemView.pic_smiley.image = [UIImage imageNamed:@"Default.png"];
}

-(void)CVcalenderItemView:(CVCalenderItemView *)itemView didLongPressedWithGesture:(UILongPressGestureRecognizer *)longPressedGesture withDate:(NSDate *)date
{
    /*if(!smiliesView)
    {
        smiliesView = [[SmiliesView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, 320, 150)];
        smiliesView.delegate = self;
        [smiliesView.layer setCornerRadius:10];
        [smiliesView.layer setBorderColor:[[UIColor blackColor] CGColor]];
        [self addSubview:smiliesView];
        [smiliesView.layer setBorderWidth:4];
    }
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationCurveLinear animations:^{
        [smiliesView setFrame:CGRectMake(0, self.frame.size.height - 200, 320, 110)];
    } completion:^(BOOL finished) {
        
    }];*/
    /*SmileyListViewController * smileyListController = [[SmileyListViewController alloc] init];
    UINavigationController * navController = [[UINavigationController alloc] initWithRootViewController:smileyListController];
    smileyListController.delegate = self;
    if(self.viewController)
    {
        [(UIViewController*) self.viewController presentViewController:navController animated:YES completion:^{
            
        }];
    }*/
    
    if(!smiliesScrollView)
    {
        NSArray * nibsArray = [[NSBundle mainBundle] loadNibNamed:@"SmiliesView" owner:nil options:nil];
        smiliesScrollView = [nibsArray objectAtIndex:0];
        [smiliesScrollView setFrame:CGRectMake(0, self.frame.size.height, 320, 240)];
        [smiliesScrollView createPages];
        [self addSubview:smiliesScrollView];
    }
    [UIView animateWithDuration:0.5 animations:^{
        [smiliesScrollView setFrame:CGRectMake(0, self.frame.size.height - smiliesScrollView.frame.size.height, smiliesScrollView.frame.size.width, smiliesScrollView.frame.size.height + 10)];
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - SmiliesListViewContrtoller Delegate

-(void) SmiliesDidClicked:(id)sender withData:(id) data
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Tittle" message:[NSString stringWithFormat:@"Tag: %@", data] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

@end
