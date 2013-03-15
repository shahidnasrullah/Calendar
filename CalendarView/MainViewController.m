//
//  NextViewController.m
//  CalendarView
//
//  Created by coeus on 12/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import "MainViewController.h"
#import "CalendarViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) createRightNavButton
{
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(rightButtonClicked:)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

-(void) rightButtonClicked: (id) sender
{
    CalendarViewController * calenderController = [[CalendarViewController alloc] initWithNibName:@"CalendarViewController" bundle:nil];
    [self.navigationController pushViewController:calenderController animated:YES];
}

-(void) addWeekView
{
    NSArray * nibsArray = [[NSBundle mainBundle] loadNibNamed:@"CVCalendarWeekView" owner:nil options:nil];
    weekView = [nibsArray objectAtIndex:0];
    
    [self.view addSubview:weekView];
    [weekView setFrame:CGRectMake(0, self.view.frame.size.height/2 - 50 , self.view.frame.size.width, 150)];
    [weekView createCalenderViewItems:[NSDate date]];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Next";
    [self addWeekView];
    [self createRightNavButton];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CVCalenderItemView Delegate

-(void)CVCalenderItemView:(CVCalenderItemView *)itemView didClickedOnGesture:(UITapGestureRecognizer *)recognizer withTag:(NSInteger)tag withDate:(NSDate *)date
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:[NSString stringWithFormat: @"Item Clicked with tag : %d", tag ] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(void)CVcalenderItemView:(CVCalenderItemView *)itemView didLongPressedWithGesture:(UILongPressGestureRecognizer *)longPressedGesture withDate:(NSDate *)date
{
    if(!smiliesView)
    {
        smiliesView = [[SmiliesView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, 320, 150)];
        smiliesView.delegate = self;
        [smiliesView.layer setCornerRadius:10];
        [smiliesView.layer setBorderColor:[[UIColor blackColor] CGColor]];
        [self.view addSubview:smiliesView];
        [smiliesView.layer setBorderWidth:4];
    }
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationCurveLinear animations:^{
        [smiliesView setFrame:CGRectMake(0, self.view.frame.size.height - 150, 320, 150)];
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - SmiliesView Delegate

-(void)SmiliesDidClicked:(id)sender withView:(SmiliesView *)view
{
    if(smiliesView)
    {
        [UIView animateWithDuration:0.6 delay:0.0 options:UIViewAnimationCurveLinear animations:^{
            [smiliesView setFrame:CGRectMake(0, self.view.frame.size.height, 320, 150)];
        } completion:^(BOOL finished) {
            
        }];
    }
}


@end
