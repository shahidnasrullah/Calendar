//
//  CVTitleView.h
//  CalendarView
//
//  Created by coeus on 11/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CVtitleViewDelegate <NSObject>

- (void)rightArrowClicked:(UITapGestureRecognizer *)recognizer;
- (void)leftArrowClicked:(UITapGestureRecognizer *)recognizer;

@end

@interface CVTitleView : UIView <UIGestureRecognizerDelegate>
{
    
}

@property (nonatomic,retain) IBOutlet UILabel * title;
@property (weak, nonatomic) IBOutlet UIImageView *rightArrow;
@property (weak, nonatomic) IBOutlet UIImageView *leftArrow;
@property (nonatomic, retain) id delegate;

-(void) addGestureToLeftArrow;
-(void) addGestureToRightArrow;

@end
