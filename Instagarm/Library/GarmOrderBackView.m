//
//  GarmOrderBackView.m
//  Instagarm
//
//  Created by AlexWang on 3/8/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import "GarmOrderBackView.h"

@implementation GarmOrderBackView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)initInterface
{
    self.garmScrollView.pagingEnabled = NO;
    [self.garmScrollView setContentSize:CGSizeMake(320, 1200)];
    self.garmScrollView.delegate = self;
    
    [self loadGarmOrderView];
    [self.garmOrderView initInterface];
    self.garmOrderView.scrollView = self.garmScrollView;
    
}
- (void)loadGarmOrderView
{
    NSArray *obj = [[NSBundle mainBundle] loadNibNamed:@"GarmOrderView" owner:self options:nil];
    for(UIView *view in obj)
    {
        if([view isKindOfClass:[GarmOrderView class]])
        {
            self.garmOrderView = (GarmOrderView*)view;
            break;
        }
    }
    [self.garmOrderView setFrame:CGRectMake(320, 0, 320, 1195)];
    [self.garmScrollView addSubview:self.garmOrderView];
    
    [UIView beginAnimations:@"left" context:nil];
    [UIView animateWithDuration:1.0 animations:nil];
    [self.garmOrderView setFrame:CGRectMake(0, 0, 320, 1195)];
    [UIView commitAnimations];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.garmOrderView.scrollView.contentOffset = self.garmScrollView.contentOffset;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
