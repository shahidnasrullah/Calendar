//
//  User.m
//  CalendarView
//
//  Created by coeus on 27/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import "User.h"
#import "Activity.h"
#import "Answer.h"
#import "Score.h"


@implementation User

@dynamic nick;
@dynamic password;
@dynamic fkUserToActivity;
@dynamic fkUserToScore;
@dynamic fkUserToAnswer;

@end
