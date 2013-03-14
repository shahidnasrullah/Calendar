//
//  CVDaysView.m
//  CalendarView
//
//  Created by coeus on 11/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import "CVDaysView.h"

@implementation CVDaysView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        [self createDaysViews];
    }
    return self;
}

-(void) createDaysViews
{
    int xOffset = 0;
    for (int i=0; i<7; i++) {
        CGRect dayFrame = CGRectMake(xOffset, 0, self.frame.size.width / 7, self.frame.size.height);
        [self createOneDayView:dayFrame withTitle:[DAYS objectAtIndex:i]];
        xOffset = xOffset + dayFrame.size.width + 1;
    }
}

-(void) createOneDayView: (CGRect) frame withTitle:(NSString*) title
{
    UIView * day = [[UIView alloc] initWithFrame:frame];
    [self addSubview:day];
    
    // Create Label and add it on day view
    UILabel * dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [dayLabel setTextAlignment:NSTextAlignmentCenter];
    dayLabel.text = title;
    dayLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    dayLabel.textColor = [UIColor colorWithRed:20.0f/255.0f green:90.0f/255.0f blue:95.0f/255.0f alpha:1];
    dayLabel.backgroundColor = [UIColor grayColor];
    //dayLabel.font = [UIFont fontWithName:@"System" size:5];
    [day addSubview:dayLabel];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
