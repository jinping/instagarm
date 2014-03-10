//
//  GarmEditView.m
//  Instagarm
//
//  Created by AlexWang on 3/6/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "GarmEditView.h"
#import "GarmObject.h"
#import "InstagarmAppDelegate.h"
#import "ChooseInstagarmViewController.h"

@implementation GarmEditView

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
    [self AddGestureRecognizersToView:self];
    oldTransform = self.transform;
    GarmObject *garment = [self getGarment];
    
    self.brand.layer.borderWidth = 1.0;
    self.brand.layer.borderColor = [UIColor blackColor].CGColor;
    [self.brand setup];
    self.brand.image = self.editImageView.image;
    [self.brand setImage:self.brand.image];
    
    self.garmImageView.image = garment.garmImage.image;
}
-(GarmObject*)getGarment
{
    GarmObject *obj = [InstagarmAppDelegate sharedInstance].garment;
    return obj;
}
- (void)setMask
{
    CALayer *mask = [CALayer layer];
    mask.contents = (id)[[UIImage imageNamed:@"mask.png"] CGImage];
    mask.frame = CGRectMake(0, 0, 300, 315);
    self.garmImageView.layer.mask = mask;
    self.garmImageView.layer.masksToBounds = YES;
    
    CALayer *maskBack = [CALayer layer];
    maskBack.contents = (id)[[UIImage imageNamed:@"maskBack.png"] CGImage];
    maskBack.frame = CGRectMake(0, 0, 320, 482);
    self.imageViewBackground.layer.mask = maskBack;
    self.imageViewBackground.layer.masksToBounds = YES;
}
#pragma Gesture Actions
- (void)AddGestureRecognizersToView:(UIView*)theView
{
    self.rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationHandler:)];
    [theView addGestureRecognizer:self.rotationGesture];
    
    self.pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchHandler:)];
    [theView addGestureRecognizer:self.pinchGesture];
    
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panHandler:)];
    [self.panGesture setMaximumNumberOfTouches:1];
    [theView addGestureRecognizer:self.panGesture];
    
}
- (void)rotationHandler:(UIRotationGestureRecognizer*)recognizer
{
    if([recognizer state] == UIGestureRecognizerStateEnded) {
        lastRotation = 0.0;
        return;
    }
    
    CGFloat rotation = 0.0 - (lastRotation - [recognizer rotation]);
    CGAffineTransform currentTransform = self.brand.imageView.transform;
    CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform,rotation);
    [self.brand.imageView setTransform:newTransform];

    lastRotation = [recognizer rotation];
    oldTransform = self.brand.imageView.transform;
}
- (void)pinchHandler:(UIPinchGestureRecognizer*)recognizer
{
    if(recognizer.state != UIGestureRecognizerStateEnded)
	{
		self.brand.imageView.transform = CGAffineTransformScale(oldTransform, recognizer.scale, recognizer.scale);
	}
	else
	{
		self.brand.imageView.transform = CGAffineTransformScale(oldTransform, recognizer.scale, recognizer.scale);
        oldTransform = self.brand.imageView.transform;
	}
}
- (void)panHandler:(UIPanGestureRecognizer*)recognizer
{
    CGPoint newPoint = [recognizer translationInView:self.brand.imageView];
    CGPoint loc = [recognizer locationInView:self.brand.imageView];
    
    NSLog(@"%f %f", loc.x, loc.y);
    if (recognizer.state == UIGestureRecognizerStateBegan)
    {
        if (CGRectContainsPoint(self.brand.imageView.bounds, loc))
        {
            isPan = YES;
        }
    }
    else if(recognizer.state != UIGestureRecognizerStateEnded)
    {
        if (isPan)
        {
            self.brand.imageView.transform = CGAffineTransformTranslate(oldTransform, newPoint.x, newPoint.y);
        }
    }
    else
    {
        if (isPan)
        {
            self.brand.imageView.transform = CGAffineTransformTranslate(oldTransform, newPoint.x, newPoint.y);
            oldTransform = self.brand.imageView.transform;
        }
        isPan = NO;
    }

}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)recognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)other
{
    return YES;
}
- (void)saveImage
{
    
}
- (void)loadGarmOrderBackView
{
    NSArray *obj = [[NSBundle mainBundle] loadNibNamed:@"GarmOrderBackView" owner:self options:nil];
    for(UIView *view in obj)
    {
        if([view isKindOfClass:[GarmOrderBackView class]])
        {
            self.garmOrderBackView = (GarmOrderBackView*)view;
            break;
        }
    }
    [self.garmOrderBackView setFrame:CGRectMake(320, 84, 320, 484)];
    [[InstagarmAppDelegate sharedInstance].viewController.view addSubview:self.garmOrderBackView];
    [self.garmOrderBackView initInterface];
    
    [UIView beginAnimations:@"left" context:nil];
    [UIView animateWithDuration:1.0 animations:nil];
    [self.garmOrderBackView setFrame:CGRectMake(0, 84, 320, 484)];
    [UIView commitAnimations];
}
#pragma actions
- (IBAction)btnCheck:(id)sender
{
    NSUserDefaults *btnStatus = [NSUserDefaults standardUserDefaults];
    self.isChecked = YES;
    [btnStatus setBool:YES forKey:@"GarmCreate"];
    
    [self.imageViewBackground setHidden:YES];
    
    ChooseInstagarmViewController *civc = (ChooseInstagarmViewController*)[InstagarmAppDelegate sharedInstance].viewController;
    [civc.btnEditGarm setImage:[UIImage imageNamed:@"btnEditGarmChecked.png"] forState:UIControlStateNormal];
    [civc.btnOrder setImage:[UIImage imageNamed:@"btnGarmOrderActive.png"] forState:UIControlStateNormal];
    
    [self saveImage];
    [self loadGarmOrderBackView];
    
}

- (IBAction)btnDelete:(id)sender
{
    ChooseInstagarmViewController *civc = (ChooseInstagarmViewController*)[InstagarmAppDelegate sharedInstance].viewController;
    [civc.btnEditGarm setImage:[UIImage imageNamed:@"btnEditgram.png"] forState:UIControlStateNormal];
    
    [self removeFromSuperview];
    
    NSInteger count = [civc.view.subviews count];
    CameraRollView *cameraRoll = (CameraRollView*)[civc.view.subviews objectAtIndex:count -1];
    [cameraRoll.imageViewBackground setHidden:NO];
    civc.lblTitle.text = @"choose-a-design";
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
