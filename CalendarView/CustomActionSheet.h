//
//  ActionSheetView.h
//  CalendarView
//
//  Created by coeus on 27/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomActionSheetDelegate <NSObject>

-(void) smiliesClicked:(id)sender;

@end

#define VIEW_WIDTH 300
#define VIEW_HEIGHT 140
#define BUTTON_WIDTH 40
#define BUTTON_HEIGHT 40

@interface CustomActionSheet : UIActionSheet <UIScrollViewDelegate>
{
    UIScrollView * scrollView;
    NSMutableArray * smilies;
    UIPageControl *pageControl;
    UIView * parentView;
}
@property (nonatomic, retain) id m_delegate;

-(void) addSmilies;
-(id) initialize;

@end
