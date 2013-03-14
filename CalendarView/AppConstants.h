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


@property (nonatomic, retain) NSArray * days;

@end
