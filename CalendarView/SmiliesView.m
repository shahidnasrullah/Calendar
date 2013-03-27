//
//  SmiliesView.m
//  CalendarView
//
//  Created by coeus on 14/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import "SmiliesView.h"



@implementation SmiliesView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        smiliesArray = [[NSMutableArray alloc] init];
        [self createSmiliesButtons];
        self.backgroundColor = [UIColor grayColor];
        //self.alpha = 0.5;
    }
    return self;
}

-(void) createSmiliesButtons
{
    int xOffset =5, yOffset = 10;
    for (int i =0; i< 14; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(xOffset, yOffset, 40, 40)];
        [button setBackgroundImage:[UIImage imageNamed:@"images.jpeg"] forState:UIControlStateNormal];
        [button setTag:i];
        [smiliesArray addObject:button];
        [button addTarget:self action:@selector(ButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        xOffset += 45;
        if(xOffset >= 320)
        {
            xOffset = 5;
            yOffset += 45;
        }
    }
}

-(void) ButtonClicked: (id) sender
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"title" message:@"clicked" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    if([self.delegate respondsToSelector:@selector(SmiliesDidClicked:withView:)])
    {
        [self.delegate SmiliesDidClicked:sender withView:self];
    }
}

//-(void) createSmiliesItems:

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)btn_closeClicked:(id)sender {
}

- (IBAction)btn_selectClicked:(id)sender {
}
@end
