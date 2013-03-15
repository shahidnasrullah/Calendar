//
//  CVCalenderItemView.h
//  CalendarView
//
//  Created by coeus on 11/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface CVCalenderItemView : UIView

@property (weak, nonatomic) IBOutlet UILabel *lbl_date;
@property (weak, nonatomic) IBOutlet UIImageView *pic_smiley;
@property (nonatomic, retain) id delegate;
@property (nonatomic, retain) NSDate * currentDate;

-(void) addTapGestureRecognizer;

@end
/*
 Delegate for item clicked
 */

@protocol CVCalenderItemViewDelegate <NSObject>

- (void)CVCalenderItemView:(CVCalenderItemView*)itemView didClickedOnGesture:(UITapGestureRecognizer *)recognizer withTag:(NSInteger) tag withDate:(NSDate*) date;

- (void)CVcalenderItemView:(CVCalenderItemView*)itemView didLongPressedWithGesture:(UILongPressGestureRecognizer*) longPressedGesture withDate:(NSDate*) date;

@end