//
//  SmileyListViewController.h
//  CalendarView
//
//  Created by coeus on 18/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SmileyListViewController : UIViewController
{
    NSMutableArray * smiliesArray;
    NSMutableArray * data;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) id delegate;

@end

@protocol SmiliesListViewControllerDelegate <NSObject>

-(void) SmiliesDidClicked:(id)sender withData:(id) data;

@end
