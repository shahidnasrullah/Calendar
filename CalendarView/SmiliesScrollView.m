//
//  SmiliesScrollView.m
//  CalendarView
//
//  Created by coeus on 25/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import "SmiliesScrollView.h"

@implementation SmiliesScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) createOnePage : (int) xOffset withColor:(UIColor*) color
{
    UIView * page = [[UIView alloc] initWithFrame:CGRectMake(xOffset, 0, 320, 130)];
    [page setBackgroundColor:color];
    [self.scrollView addSubview:page];
}

-(void) createPages
{
    colorsArray = [[NSArray alloc] initWithObjects:[UIColor greenColor], [UIColor redColor], [UIColor blueColor], nil];
    for (int i =0; i<3; i++) {
        [self createOnePage:i*320 withColor:[colorsArray objectAtIndex:i]];
    }
    self.scrollView.contentSize = CGSizeMake(3 * 320, 140);
    self.scrollView.pagingEnabled = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)btn_cancelClicked:(id)sender {
}

- (IBAction)btn_selectClicked:(id)sender {
    
    
}
@end
