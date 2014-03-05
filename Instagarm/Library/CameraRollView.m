//
//  CameraRollView.m
//  Instagarm
//
//  Created by AlexWang on 3/4/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import "CameraRollView.h"

@implementation CameraRollView

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
    NSUserDefaults *btnStatus = [NSUserDefaults standardUserDefaults];
    BOOL btnPhotoCheck = [btnStatus boolForKey:@"Photo"];
    [self.btnCheck setImage:[UIImage imageNamed:(btnPhotoCheck?@"btnCheck1.png":@"btnUncheck1.png")] forState:UIControlStateNormal];
}
#pragma Actions
- (IBAction)btnCheck:(id)sender
{
    NSUserDefaults *btnStatus = [NSUserDefaults standardUserDefaults];
    if(self.isChecked)
    {
        [self.btnCheck setImage:[UIImage imageNamed:@"btnUncheck1.png"] forState:UIControlStateNormal];
        self.isChecked = NO;
        [btnStatus setBool:NO forKey:@"Photo"];
    }
    else
    {
        [self.btnCheck setImage:[UIImage imageNamed:@"btnCheck1.png"] forState:UIControlStateNormal];
        self.isChecked = YES;
        [btnStatus setBool:YES forKey:@"Photo"];
    }
    [btnStatus synchronize];
}

- (IBAction)btnDelete:(id)sender
{
    self.selectedImageView.image = nil;
    [self removeFromSuperview];
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
