//
//  GarmEditView.m
//  Instagarm
//
//  Created by AlexWang on 3/6/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import "GarmEditView.h"

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
    CGAffineTransform currentTransform = self.editImageView.transform;
    CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform,rotation);
    [self.editImageView setTransform:newTransform];
    
    lastRotation = [recognizer rotation];
    oldTransform = self.editImageView.transform;
}
- (void)pinchHandler:(UIPinchGestureRecognizer*)recognizer
{
    if(recognizer.state != UIGestureRecognizerStateEnded)
	{
		self.editImageView.transform = CGAffineTransformScale(oldTransform, recognizer.scale, recognizer.scale);
	}
	else
	{
		self.editImageView.transform = CGAffineTransformScale(oldTransform, recognizer.scale, recognizer.scale);
        oldTransform = self.editImageView.transform;
	}
}
- (void)panHandler:(UIPanGestureRecognizer*)recognizer
{
    CGPoint newPoint = [recognizer translationInView:self.editImageView];
    CGPoint loc = [recognizer locationInView:self.editImageView];
    
    NSLog(@"%f %f", loc.x, loc.y);
    if (recognizer.state == UIGestureRecognizerStateBegan)
    {
        if (CGRectContainsPoint(self.editImageView.bounds, loc))
        {
            isPan = YES;
        }
    }
    else if(recognizer.state != UIGestureRecognizerStateEnded)
    {
        if (isPan)
            self.editImageView.transform = CGAffineTransformTranslate(oldTransform, newPoint.x, newPoint.y);
    }
    else
    {
        if (isPan)
        {
            self.editImageView.transform = CGAffineTransformTranslate(oldTransform, newPoint.x, newPoint.y);
            oldTransform = self.editImageView.transform;
        }
        isPan = NO;
    }

}
#pragma actions
- (IBAction)btnCheck:(id)sender {
}

- (IBAction)btnDelete:(id)sender {
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
