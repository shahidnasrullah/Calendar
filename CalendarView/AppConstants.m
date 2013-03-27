//
//  AppConstants.m
//  CalendarView
//
//  Created by coeus on 11/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import "AppConstants.h"

@implementation AppConstants
@synthesize days;


+(NSDate *)getStartDate
{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSDate * date = [defaults objectForKey:kStartDate];
    if(!date)
    {
        date = [NSDate date];
        [defaults setValue:date forKey:kStartDate];
    }
    
    return date;
}

+(void)setStartDate:(NSDate *)date
{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:date forKey:kStartDate];
}


@end
