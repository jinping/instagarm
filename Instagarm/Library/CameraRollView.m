//
//  CameraRollView.m
//  Instagarm
//
//  Created by AlexWang on 3/4/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import "CameraRollView.h"
#import "GarmEditView.h"
#import "InstagarmAppDelegate.h"
#import "ChooseInstagarmViewController.h"
#import "MyImagePicker.h"

@implementation CameraRollView
@synthesize  garmEditView;

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
    
    self.isChecked = btnPhotoCheck;
    
    self.selectedImageView.image = [self squareImageWithImage:self.originalImage scaledToSize:CGSizeMake(640, 640)];
}
#pragma Crop Image
- (UIImage *)squareImageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
    double ratio;
    double delta;
    CGPoint offset;
    
    //make a new square size, that is the resized imaged width
    CGSize sz = CGSizeMake(newSize.width, newSize.width);
    
    //figure out if the picture is landscape or portrait, then
    //calculate scale factor and offset
    if (image.size.width > image.size.height) {
        ratio = newSize.width / image.size.width;
        delta = (ratio*image.size.width - ratio*image.size.height);
        offset = CGPointMake(delta/2, 0);
    } else {
        ratio = newSize.width / image.size.height;
        delta = (ratio*image.size.height - ratio*image.size.width);
        offset = CGPointMake(0, delta/2);
    }
    
    //make the final clipping rect based on the calculated values
    CGRect clipRect = CGRectMake(-offset.x, -offset.y,
                                 (ratio * image.size.width) + delta,
                                 (ratio * image.size.height) + delta);
    
    
    //start a new context, with scale factor 0.0 so retina displays get
    //high quality image
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(sz, YES, 0.0);
    } else {
        UIGraphicsBeginImageContext(sz);
    }
    UIRectClip(clipRect);
    [image drawInRect:clipRect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
- (void)loadGarmEditView
{
    NSArray *obj = [[NSBundle mainBundle] loadNibNamed:@"GarmEditView" owner:self options:nil];
    for(UIView *view in obj)
    {
        if([view isKindOfClass:[GarmEditView class]])
        {
            self.garmEditView = (GarmEditView*)view;
            break;
        }
    }
    [self.garmEditView setFrame:CGRectMake(320, 86, 320, 482)];
    [[InstagarmAppDelegate sharedInstance].viewController.view addSubview:self.garmEditView];
    
    [UIView beginAnimations:@"left" context:nil];
    [UIView animateWithDuration:1.0 animations:nil];
    [self.garmEditView setFrame:CGRectMake(0, 86, 320, 482)];
    [UIView commitAnimations];
    
}

#pragma Actions
- (IBAction)btnCheck:(id)sender
{
    NSUserDefaults *btnStatus = [NSUserDefaults standardUserDefaults];
    self.isChecked = YES;
    [btnStatus setBool:YES forKey:@"Photo"];
    [btnStatus synchronize];
    
    ChooseInstagarmViewController *civc = (ChooseInstagarmViewController*)[InstagarmAppDelegate sharedInstance].viewController;
    [civc.btnEditGarm setImage:[UIImage imageNamed:@"btnEditgramActive.png"] forState:UIControlStateNormal];
    [civc.btnGallory setImage:[UIImage imageNamed:@"btnGallorySelected.png"] forState:UIControlStateNormal];
    [self.imageViewBackground setHidden:YES];
    civc.lblTitle.text = @"create-a-garm";
    
    [self loadGarmEditView];
    self.garmEditView.editImageView.image = self.originalImage;
    [self.garmEditView initInterface];
}

- (IBAction)btnDelete:(id)sender
{
    self.selectedImageView.image = nil;
    [self removeFromSuperview];
    
    ChooseInstagarmViewController *civc = (ChooseInstagarmViewController*)[InstagarmAppDelegate sharedInstance].viewController;
    NSInteger count = civc.view.subviews.count;
    MyImagePicker *imagePicker = (MyImagePicker*)[civc.view.subviews objectAtIndex:count -1];
    [imagePicker.imageViewBackground  setHidden:NO];
    
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
