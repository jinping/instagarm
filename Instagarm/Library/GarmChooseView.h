//
//  GarmChooseView.h
//  Instagarm
//
//  Created by AlexWang on 3/3/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyAlbumPicker.h"

@interface GarmChooseView : UIView<UIScrollViewDelegate>
{
    NSArray *garmList;
}

@property (strong, nonatomic) IBOutlet UIScrollView *scrollViewGarm;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) IBOutlet UIButton *btnCheck;
@property (strong, nonatomic) IBOutlet UILabel *lblGarmTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblPriceTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblGarm;
@property (strong, nonatomic) IBOutlet UILabel *lblPrice;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewBackground;

@property (nonatomic) BOOL isChecked;
@property (strong, nonatomic) MyAlbumPicker *albumPicker;
- (void)initInterface;
- (IBAction)btnCheck:(id)sender;

@end
