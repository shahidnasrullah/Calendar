//
//  Question.h
//  CalendarView
//
//  Created by coeus on 27/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Answer;

@interface Question : NSManagedObject

@property (nonatomic, retain) NSNumber * questionId;
@property (nonatomic, retain) NSString * question;
@property (nonatomic, retain) NSDate * startDay;
@property (nonatomic, retain) NSDate * endDay;
@property (nonatomic, retain) NSNumber * answerId;
@property (nonatomic, retain) NSString * answers;
@property (nonatomic, retain) NSSet *fkQuestionToAnswer;
@end

@interface Question (CoreDataGeneratedAccessors)

- (void)addFkQuestionToAnswerObject:(Answer *)value;
- (void)removeFkQuestionToAnswerObject:(Answer *)value;
- (void)addFkQuestionToAnswer:(NSSet *)values;
- (void)removeFkQuestionToAnswer:(NSSet *)values;

@end
