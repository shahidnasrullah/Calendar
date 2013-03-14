//
//  AppDelegate.h
//  CalendarView
//
//  Created by coeus on 11/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CalendarViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UINavigationController * navController;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) CalendarViewController *viewController;

@end
