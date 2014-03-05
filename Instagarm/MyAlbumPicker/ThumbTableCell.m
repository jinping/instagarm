//
//  ThumbTableCell.m
//  Instagarm
//
//  Created by AlexWang on 3/5/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import "ThumbTableCell.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "CameraRollView.h"
#import "InstagarmAppDelegate.h"

@implementation ThumbTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setAsset:(NSArray *)asset
{
    ALAsset *tmpAsset = (ALAsset*)[asset objectAtIndex:0];
    self.thumbImage1.image = [UIImage imageWithCGImage:[tmpAsset thumbnail]];
    
    tmpAsset = (ALAsset*)[asset objectAtIndex:1];
    self.thumbImage2.image = [UIImage imageWithCGImage:[tmpAsset thumbnail]];
    
    tmpAsset = (ALAsset*)[asset objectAtIndex:2];
    self.thumbImage3.image = [UIImage imageWithCGImage:[tmpAsset thumbnail]];
    
}

- (void)loadCameraRollView:(UIImage*)image
{
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
    cameraRollView.selectedImageView.image = image;
    [cameraRollView setFrame:CGRectMake(320, 88, 320, 480)];
    cameraRollView.tag = 1003;
    [[InstagarmAppDelegate sharedInstance].viewController.view addSubview:cameraRollView];
    
    [UIView beginAnimations:@"left" context:nil];
    [UIView animateWithDuration:1.0 animations:nil];
    [cameraRollView setFrame:CGRectMake(0, 88, 320, 480)];
    [UIView commitAnimations];


}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    
    NSInteger index = 0;
    if(CGRectContainsPoint(self.thumbImage1.frame, touchPoint))
    {
        index = self.indexPath.row * 3;
    }
    else if(CGRectContainsPoint(self.thumbImage2.frame, touchPoint))
    {
        index = self.indexPath.row * 3 + 1;
    }
    else if(CGRectContainsPoint(self.thumbImage3.frame, touchPoint))
    {
        index = self.indexPath.row * 3 + 2;
    }
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:[NSString stringWithFormat:@"%d", index],@"Index", nil];
    [self.parent setSelectImage:userInfo];
}
@end
