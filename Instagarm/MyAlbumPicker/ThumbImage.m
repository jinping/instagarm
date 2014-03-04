//
//  ThumbImage.m
//  Instagarm
//
//  Created by AlexWang on 3/4/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import "ThumbImage.h"
#import "CameraRollView.h"
#import "InstagarmAppDelegate.h"

@implementation ThumbImage

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"thumb touched");
    CameraRollView *cameraRollView;
    
    NSArray *obj = [[NSBundle mainBundle] loadNibNamed:@"CameraRollView" owner:self options:nil];
    for(UIView *view in obj)
    {
        if([view isKindOfClass:[CameraRollView class]])
        {
            cameraRollView = (CameraRollView*)view;
            break;
        }
    }
    cameraRollView.selectedImageView.image = self.fullImage;
    [cameraRollView setFrame:CGRectMake(320, 95, 320, 473)];
    cameraRollView.tag = 1003;
    [[InstagarmAppDelegate sharedInstance].viewController.view addSubview:cameraRollView];
    
    [UIView beginAnimations:@"left" context:nil];
    [UIView animateWithDuration:1.0 animations:nil];
    [cameraRollView setFrame:CGRectMake(0, 95, 320, 473)];
    [UIView commitAnimations];
    
}
@end
