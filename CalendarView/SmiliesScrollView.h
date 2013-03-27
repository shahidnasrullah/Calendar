//
//  SmiliesScrollView.h
//  CalendarView
//
//  Created by coeus on 25/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SmiliesScrollView : UIView
{
    NSArray * colorsArray;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControll;

- (IBAction)btn_cancelClicked:(id)sender;
- (IBAction)btn_selectClicked:(id)sender;
-(void) createPages;

@end
