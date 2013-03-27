//
//  Answer.h
//  CalendarView
//
//  Created by coeus on 27/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Question;

@interface Answer : NSManagedObject

@property (nonatomic, retain) NSString * nick;
@property (nonatomic, retain) NSNumber * questionId;
@property (nonatomic, retain) NSString * answer;
@property (nonatomic, retain) Question *fkAnswerToQuestion;

@end
