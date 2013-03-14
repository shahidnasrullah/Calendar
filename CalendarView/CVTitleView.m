//
//  CVTitleView.m
//  CalendarView
//
//  Created by coeus on 11/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import "CVTitleView.h"

@implementation CVTitleView
@synthesize title, delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //title = [[UILabel alloc] initWithFrame:frame];
        //title.bounds = self.bounds;
        //title.text = @"some text";
        //self.backgroundColor = [UIColor greenColor];
        
    }
    return self;
}

-(void) addGestureToLeftArrow
{
    UITapGestureRecognizer * leftTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftArrowClicked:)];
    [self.leftArrow addGestureRecognizer:leftTap];
    leftTap.delegate = self;
}

- (void)leftArrowClicked:(UITapGestureRecognizer *)recognizer {
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self.leftArrow setAlpha:0.5];
    } completion:^(BOOL finished) {
        [self.leftArrow setAlpha:1];
    }];
    if([self.delegate respondsToSelector:@selector(leftArrowClicked:)])
    {
        [self.delegate leftArrowClicked:recognizer];
    }
}

-(void) addGestureToRightArrow
{
    UITapGestureRecognizer * rightTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightArrowClicked:)];
    [self.rightArrow addGestureRecognizer:rightTap];
    rightTap.delegate = self;
}

- (void)rightArrowClicked:(UITapGestureRecognizer *)recognizer {
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self.rightArrow setAlpha:0.5];
    } completion:^(BOOL finished) {
        [self.rightArrow setAlpha:1];
    }];
    if([self.delegate respondsToSelector:@selector(rightArrowClicked:)])
    {
        [self.delegate rightArrowClicked:recognizer];
    }
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
