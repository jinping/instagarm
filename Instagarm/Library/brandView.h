//
//  brandView.h
//  Instagarm
//
//  Created by AlexWang on 3/7/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface brandView : UIView
{
    @private
    CGSize _originalImageViewSize;
}
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIImage *image;

- (void)setup;
- (void)setImage:(UIImage *)image;

@end
