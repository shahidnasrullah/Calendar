//
//  Activity.h
//  CalendarView
//
//  Created by coeus on 27/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Activity : NSManagedObject

@property (nonatomic, retain) NSString * nick;
@property (nonatomic, retain) NSDate * day;
@property (nonatomic, retain) NSNumber * activityId;
@property (nonatomic, retain) NSString * comment;
@property (nonatomic, retain) NSManagedObject *fkActivityToUser;

@end
