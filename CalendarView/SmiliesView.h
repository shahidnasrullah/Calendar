//
//  SmiliesView.h
//  CalendarView
//
//  Created by coeus on 14/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SmiliesView : UIView
{
    NSMutableArray * smiliesArray;
}
@property (nonatomic, retain) id delegate;
- (IBAction)btn_closeClicked:(id)sender;
- (IBAction)btn_selectClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end


@protocol SmiliesViewDelegate <NSObject>

-(void) SmiliesDidClicked:(id)sender withView:(SmiliesView*)view;

@end
