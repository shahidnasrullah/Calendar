//
//  DatePickerViewController.h
//  CalendarView
//
//  Created by coeus on 27/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickerViewController : UIViewController
{
    NSDate * currentDate;
}
@property (weak, nonatomic) IBOutlet UILabel *lbl_startDate;

- (IBAction)btn_selectClicked:(id)sender;
- (IBAction)picked_valueChanged:(id)sender;
@end
