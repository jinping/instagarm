//
//  ChooseInstagarmViewController.h
//  Instagarm
//
//  Created by AlexWang on 3/3/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseInstagarmViewController : UIViewController<UIScrollViewDelegate>
{
    NSArray *garmList;
    BOOL isChecked;
}
@property (strong, nonatomic) IBOutlet UIButton *btnGarm;
@property (strong, nonatomic) IBOutlet UIButton *btnGallory;
@property (strong, nonatomic) IBOutlet UIButton *btnEditGarm;
@property (strong, nonatomic) IBOutlet UIButton *btnOrder;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollViewGarm;
@property (strong, nonatomic) IBOutlet UILabel *lblGarmName;
@property (strong, nonatomic) IBOutlet UILabel *lblGarmPrice;
@property (strong, nonatomic) IBOutlet UIButton *btnCheck;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;


- (IBAction)btnBack:(id)sender;
- (IBAction)btnGarm:(id)sender;
- (IBAction)btnGallory:(id)sender;
- (IBAction)btnEditGarm:(id)sender;
- (IBAction)btnOrder:(id)sender;
- (IBAction)btnCheck:(id)sender;


@end
