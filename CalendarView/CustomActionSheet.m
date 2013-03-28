//
//  ActionSheetView.m
//  CalendarView
//
//  Created by coeus on 27/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import "CustomActionSheet.h"

@implementation CustomActionSheet
@synthesize m_delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

-(id) initWithTitle:(NSString *)title delegate:(id<UIActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    self = [super initWithTitle:@"\n \n \n \n \n \n \n \n \n" delegate:nil cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:nil, nil];
    if(self)
    {
        [self createScrollView];
        [self createSmillies:100];
    }
    return  self;
}

-(void) createScrollView
{
    parentView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, 320, 190)];
    [self addSubview:parentView];
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 10, 300, 140)];
    [parentView addSubview:scrollView];
    scrollView.delegate = self;
    //smilies = [[NSMutableArray alloc] init];
    scrollView.pagingEnabled = YES;
}

-(void) createSmillies : (int) totalsmilies
{
    int viewXOffset = 0, viewYOffset = 0;
    int xOffset = 0, yOffset = 0;
    int totalPages = 0;
    //int buttonHeight = 40, buttonWidth = 40;
    UIView * pageView;
    for (int i=0; i<totalsmilies; i++) {
        if(i % 18 == 0)
        {
            pageView = [[UIView alloc] initWithFrame:CGRectMake(viewXOffset, viewYOffset, VIEW_WIDTH, VIEW_HEIGHT)];
            [scrollView addSubview:pageView];
            totalPages++;
            xOffset = 0;
            yOffset = 0;
            viewXOffset += VIEW_WIDTH;
        }
        
        UIButton * smiliey = [UIButton buttonWithType:UIButtonTypeCustom];
        [smiliey setFrame:CGRectMake(xOffset, yOffset, BUTTON_WIDTH, BUTTON_HEIGHT)];
        [smiliey setBackgroundImage:[UIImage imageNamed:@"images.jpeg"] forState:UIControlStateNormal];
        [smiliey setTag:i];
        [smiliey addTarget:self action:@selector(smiliesClicked:) forControlEvents:UIControlEventTouchUpInside];

        
        [pageView addSubview:smiliey];
        xOffset += BUTTON_WIDTH + 10;
        if(xOffset + BUTTON_WIDTH > VIEW_WIDTH)
        {
            xOffset = 0;
            yOffset += BUTTON_HEIGHT + 10;
        }
    }
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 140)];
    view.backgroundColor = [UIColor redColor];
    scrollView.contentSize = CGSizeMake(viewXOffset, VIEW_HEIGHT);
    [self addPagingControl:totalPages];
}
-(void) addPagingControl: (int)pages
{
    pageControl = [[UIPageControl alloc] init];
    pageControl.frame = CGRectMake(0, 145, 320, 40);
    pageControl.numberOfPages = pages;
    pageControl.currentPage = 0;
    [pageControl addTarget:self action:@selector(pagingControllValueChanged:) forControlEvents:UIControlEventValueChanged];
    [parentView addSubview:pageControl];
}

-(void) pagingControllValueChanged:(id)sender
{
    [UIView animateWithDuration:0.5 animations:^{
        [scrollView setContentOffset:CGPointMake(pageControl.currentPage * VIEW_WIDTH, 0)];
    }];
    
}

-(void) smiliesClicked:(id)sender
{
    if([self.m_delegate respondsToSelector:@selector(smiliesClicked:)])
    {
        [self.m_delegate smiliesClicked:sender];
    }
    
}

#pragma mark - UIScrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollVew
{
    CGFloat pageWidth = scrollView.frame.size.width; // you need to have a **iVar** with getter for scrollView
    float fractionalPage = scrollVew.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    pageControl.currentPage = page;
}



@end
