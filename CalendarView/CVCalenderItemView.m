//
//  CVCalenderItemView.m
//  CalendarView
//
//  Created by coeus on 11/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import "CVCalenderItemView.h"

@implementation CVCalenderItemView
@synthesize currentDate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void) addTapGestureRecognizer
{
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self addGestureRecognizer:tapGesture];
    UILongPressGestureRecognizer * longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(LongPressGesture:)];
    [self addGestureRecognizer:longPressGesture];
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self setAlpha:0.5];
    } completion:^(BOOL finished) {
        [self setAlpha:1];
    }];
    if([self.delegate respondsToSelector:@selector(CVCalenderItemView:didClickedOnGesture:withTag:withDate: )])
    {
        [self.delegate CVCalenderItemView:self didClickedOnGesture:recognizer withTag:self.tag withDate:currentDate];
    }
}

-(void) LongPressGesture: (UILongPressGestureRecognizer *) gesture
{
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            if ([self.delegate respondsToSelector:@selector(CVcalenderItemView:didLongPressedWithGesture:withDate:)]) {
                [self.delegate CVcalenderItemView:self didLongPressedWithGesture:gesture withDate:self.currentDate];
            }
            break;
        default:
            NSLog(@"Recognized");
            break;
    }
    
}

@end
