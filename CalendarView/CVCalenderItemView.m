//
//  CVCalenderItemView.m
//  CalendarView
//
//  Created by coeus on 11/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import "CVCalenderItemView.h"

@implementation CVCalenderItemView

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
    if([self.delegate respondsToSelector:@selector(CVCalenderItemViewDidClicked:withTag:)])
    {
        [self.delegate CVCalenderItemViewDidClicked:recognizer withTag:self.tag];
    }
}

-(void) LongPressGesture: (UILongPressGestureRecognizer *) gesture
{
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            NSLog(@"Begining....");
            break;
        case UIGestureRecognizerStateCancelled:
            NSLog(@"Canceleed.....");
            break;
        case UIGestureRecognizerStateEnded:
            NSLog(@"Ended....");
            break;
        case UIGestureRecognizerStateChanged:
            NSLog(@"Changed...");
            break;
        case UIGestureRecognizerStateFailed:
            NSLog(@"Failed....");
            break;
        case UIGestureRecognizerStatePossible:
            NSLog(@"Possible...");
            break;
        default:
            NSLog(@"Recognized");
            break;
    }
    /*UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"LongPress" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];*/
}

@end
