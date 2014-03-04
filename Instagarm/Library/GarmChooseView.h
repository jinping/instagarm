//
//  GarmChooseView.h
//  Instagarm
//
//  Created by AlexWang on 3/3/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GarmChooseView : UIView<UIScrollViewDelegate>
{
    NSArray *garmList;
    BOOL isChecked;
}

@property (strong, nonatomic) IBOutlet UIScrollView *scrollViewGarm;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) IBOutlet UIButton *btnCheck;
@property (strong, nonatomic) IBOutlet UILabel *lblGarmTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblPriceTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblGarm;
@property (strong, nonatomic) IBOutlet UILabel *lblPrice;

- (void)initInterface;
- (IBAction)btnCheck:(id)sender;

@end
