//
//  ViewController.h
//  CalendarView
//
//  Created by coeus on 11/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CVCalenderView.h"
#import "NextViewController.h"

@interface ViewController : UIViewController
{
    CVCalenderView * calenderView;
}

-(IBAction)rightBarButtonItemClickecd :(id)sender;

@end
