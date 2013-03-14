//
//  CVCalenderItemView.h
//  CalendarView
//
//  Created by coeus on 11/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CVCalenderItemViewDelegate <NSObject>

- (void)CVCalenderItemViewDidClicked:(UITapGestureRecognizer *)recognizer withTag:(NSInteger) tag;

@end

@interface CVCalenderItemView : UIView 
@property (weak, nonatomic) IBOutlet UILabel *lbl_date;
@property (weak, nonatomic) IBOutlet UIImageView *pic_smiley;
@property (nonatomic, retain) id delegate;

-(void) addTapGestureRecognizer;

@end
