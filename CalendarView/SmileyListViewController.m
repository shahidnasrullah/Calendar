//
//  SmileyListViewController.m
//  CalendarView
//
//  Created by coeus on 18/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import "SmileyListViewController.h"


@interface SmileyListViewController ()

@end

@implementation SmileyListViewController
@synthesize delegate;

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
    self.title = @"Smiley";
    data = [[NSMutableArray alloc] init];
    [self createSmiliesButtons];
    [self createCloseButton];
    // Do any additional setup after loading the view from its nib.
}

-(void) createCloseButton
{
    UIBarButtonItem * closeButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(closeButtonDidSelected:)];
    self.navigationItem.leftBarButtonItem = closeButton;
}

-(void) closeButtonDidSelected:(id) sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void) createSmiliesButtons
{
    int xOffset =5, yOffset = 10;
    for (int i =0; i< 200; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(xOffset, yOffset, 40, 40)];
        [button setBackgroundImage:[UIImage imageNamed:@"images.jpeg"] forState:UIControlStateNormal];
        [button setTag:i];
        [smiliesArray addObject:button];
        [data addObject:[NSNumber numberWithInt:i]];
        [button addTarget:self action:@selector(SmiliesDidClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:button];
        xOffset += 45;
        if(xOffset >= 320)
        {
            xOffset = 5;
            yOffset += 45;
        }
    }
    
    self.scrollView.contentSize = CGSizeMake(320, yOffset + 50);
}

-(void) SmiliesDidClicked:(id)sender
{
    if([self.delegate respondsToSelector:@selector(SmiliesDidClicked:withData:)])
    {
        [self.delegate SmiliesDidClicked:sender withData:[data objectAtIndex:((UIButton*)sender).tag]];
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
