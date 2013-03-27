//
//  User.h
//  CalendarView
//
//  Created by coeus on 27/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Activity, Answer, Score;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * nick;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSSet *fkUserToActivity;
@property (nonatomic, retain) Score *fkUserToScore;
@property (nonatomic, retain) NSSet *fkUserToAnswer;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addFkUserToActivityObject:(Activity *)value;
- (void)removeFkUserToActivityObject:(Activity *)value;
- (void)addFkUserToActivity:(NSSet *)values;
- (void)removeFkUserToActivity:(NSSet *)values;

- (void)addFkUserToAnswerObject:(Answer *)value;
- (void)removeFkUserToAnswerObject:(Answer *)value;
- (void)addFkUserToAnswer:(NSSet *)values;
- (void)removeFkUserToAnswer:(NSSet *)values;

@end
