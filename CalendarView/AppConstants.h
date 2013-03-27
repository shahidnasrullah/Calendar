//
//  AppConstants.h
//  CalendarView
//
//  Created by coeus on 11/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppConstants : NSObject


#define DAYS @[@"Sun",@"Mon",@"Tue",@"Wed",@"Thu",@"Fri",@"Sat"]
#define MONTH_DAYS @[@31,@28,@31,@30,@31,@30,@31,@31,@30,@31,@30,@31]
#define TOP_VIEW_HEIGHT 50
#define CALENDER_WIDTH 320
#define DAYS_VIEW_HEIGHT 30
#define kStartDate @"start_date"
#define kFriendsAccessLevel @"user_access_level"

typedef enum
{
    FRIENDS_ACCESS_LEVEL_ALL,
    FRIENDS_ACCESS_LEVEL_SOME,
    FRIENDS_ACCESS_LEVEL_NO
}
FRIENDS_ACCESS_LEVEL;


@property (nonatomic, retain) NSArray * days;
+(NSDate*) getStartDate;
+(void) setStartDate:(NSDate *) date;

@end
