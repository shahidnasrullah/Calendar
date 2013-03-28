//
//  NextViewController.m
//  CalendarView
//
//  Created by coeus on 12/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import "MainViewController.h"
#import "CalendarViewController.h"
#import "SettingsViewController.h"

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Next";
    [self addWeekView];
    [self createRightNavButton];
    [self createLeftNavButton];
    [self createAndLoadQuote];
    [self createAndLoadQuestion];
    // Do any additional setup after loading the view from its nib.
}

-(void) createAndLoadQuestion
{
    NSString * quote = @"Since the alien army vastly outnumbers the team, players must use the post-apocalyptic world to their advantage, such as seeking cover behind dumpsters, pillars, cars, rubble, and other objects. Since the alien army vastly outnumbers the team, players must use the post-apocalyptic world to their advantage, such as seeking cover behind dumpsters, pillars, cars, rubble, and other objects.";
    CGSize maximumLabelSize = CGSizeMake(296, FLT_MAX);
    CGSize labelSize = [quote sizeWithFont:[UIFont fontWithName:@"Helvetica" size:15] constrainedToSize:maximumLabelSize];
    UILabel * lbl_Quote = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.question_scrollView.frame.size.width, labelSize.height)];
    lbl_Quote.text = quote;
    lbl_Quote.lineBreakMode = kCTLineBreakByWordWrapping;
    lbl_Quote.numberOfLines = 0;
    lbl_Quote.font = [UIFont fontWithName:@"Helvetica" size:14];
    UIView * quoteView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,self.question_scrollView.frame.size.width, labelSize.height)];
    [quoteView addSubview:lbl_Quote];
    [quoteView setBackgroundColor:[UIColor redColor]];
    [self.question_scrollView addSubview:lbl_Quote];
    self.question_scrollView.contentSize = CGSizeMake(quoteView.frame.size.width, quoteView.frame.size.height);

}

-(void) createAndLoadQuote
{
    NSString * quote = @"Since the alien army vastly outnumbers the team, players must use the post-apocalyptic world to their advantage, such as seeking cover behind dumpsters, pillars, cars, rubble, and other objects. Since the alien army vastly outnumbers the team, players must use the post-apocalyptic world to their advantage, such as seeking cover behind dumpsters, pillars, cars, rubble, and other objects.";
    CGSize maximumLabelSize = CGSizeMake(296, FLT_MAX);
    CGSize labelSize = [quote sizeWithFont:[UIFont fontWithName:@"Helvetica" size:15] constrainedToSize:maximumLabelSize];
    UILabel * lbl_Quote = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.quote_scrollView.frame.size.width, labelSize.height)];
    lbl_Quote.text = quote;
    lbl_Quote.lineBreakMode = kCTLineBreakByWordWrapping;
    lbl_Quote.numberOfLines = 0;
    lbl_Quote.font = [UIFont fontWithName:@"Helvetica" size:14];
    UIView * quoteView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,self.quote_scrollView.frame.size.width, labelSize.height)];
    [quoteView addSubview:lbl_Quote];
    [quoteView setBackgroundColor:[UIColor redColor]];
    [self.quote_scrollView addSubview:lbl_Quote];
    self.quote_scrollView.contentSize = CGSizeMake(quoteView.frame.size.width, quoteView.frame.size.height);
}

-(void) createRightNavButton
{
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settings.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(rightButtonClicked:)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

-(void) rightButtonClicked: (id) sender
{
    SettingsViewController * settings = [[SettingsViewController alloc] init];
    [self.navigationController pushViewController:settings animated:YES];
}

-(void) createLeftNavButton
{
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(leftButtonClicked:)];
    self.navigationItem.leftBarButtonItem = leftButton;
}

-(void) leftButtonClicked: (id) sender
{
    CalendarViewController * calenderController = [[CalendarViewController alloc] initWithNibName:@"CalendarViewController" bundle:nil];
    [self.navigationController pushViewController:calenderController animated:YES];
}

-(void) addWeekView
{
    NSArray * nibsArray = [[NSBundle mainBundle] loadNibNamed:@"CVCalendarWeekView" owner:nil options:nil];
    weekView = [nibsArray objectAtIndex:0];
    [self.view addSubview:weekView];
    [weekView setFrame:CGRectMake(0, 125 , self.view.frame.size.width, 130)];
    weekView.delegate = self;
    [weekView createDaysView];
    [weekView createCalenderViewItems:[AppConstants getStartDate]];
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
    customActionSheetView = [[CustomActionSheet alloc] initWithTitle:nil delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];
    customActionSheetView.m_delegate = self;
    [customActionSheetView showInView:self.view];
}

- (IBAction)btn_monthClicked:(id)sender {
    
}

#pragma mark - CustomActionSheet Delegate

-(void)smiliesClicked:(id)sender
{
    [customActionSheetView dismissWithClickedButtonIndex:0 animated:YES];
}
@end
