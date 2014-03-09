//
//  GarmOrderBackView.h
//  Instagarm
//
//  Created by AlexWang on 3/8/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GarmOrderView.h"

@interface GarmOrderBackView : UIView
@property (strong, nonatomic) IBOutlet UIScrollView *garmScrollView;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewBackground;
@property (strong, nonatomic) GarmOrderView *garmOrderView;

- (void)initInterface;
@end
