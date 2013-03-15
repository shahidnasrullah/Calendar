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

@end


@protocol SmiliesViewDelegate <NSObject>

-(void) SmiliesDidClicked:(id)sender withView:(SmiliesView*)view;

@end
