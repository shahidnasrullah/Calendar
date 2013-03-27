//
//  Score.h
//  CalendarView
//
//  Created by coeus on 27/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Score : NSManagedObject

@property (nonatomic, retain) NSString * nick;
@property (nonatomic, retain) NSNumber * score;
@property (nonatomic, retain) NSManagedObject *fkScoreToUser;

@end
