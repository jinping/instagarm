//
//  brandView.m
//  Instagarm
//
//  Created by AlexWang on 3/7/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import "brandView.h"

@implementation brandView

- (void)setup
{
    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor clearColor];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height)];
    self.imageView.userInteractionEnabled = YES;
    [self addSubview:self.imageView];
   
}

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	
	if (self) {
		self.frame = frame;
        [self setup];
	}
	
	return self;
}
- (void)setImage:(UIImage *)image
{
    if (_image != image) {
        _image = image;
    }
    
    float _imageScale = self.frame.size.width / image.size.width;
    self.imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    _originalImageViewSize = CGSizeMake(image.size.width*_imageScale, image.size.height*_imageScale);
    self.imageView.image = image;
    self.imageView.center = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0);
}

/*float _lastTransX = 0.0, _lastTransY = 0.0;
- (void)moveImage:(UIPanGestureRecognizer *)sender
{
    CGPoint translatedPoint = [sender translationInView:self];
    
    if([sender state] == UIGestureRecognizerStateBegan) {
        _lastTransX = 0.0;
        _lastTransY = 0.0;
    }
    
    CGAffineTransform trans = CGAffineTransformMakeTranslation(translatedPoint.x - _lastTransX, translatedPoint.y - _lastTransY);
    CGAffineTransform newTransform = CGAffineTransformConcat(self.imageView.transform, trans);
    _lastTransX = translatedPoint.x;
    _lastTransY = translatedPoint.y;
    
    self.imageView.transform = newTransform;
}

float _lastScale = 1.0;
- (void)scaleImage:(UIPinchGestureRecognizer *)sender
{
    if([sender state] == UIGestureRecognizerStateBegan) {
        
        _lastScale = 1.0;
        return;
    }
    
    CGFloat scale = [sender scale]/_lastScale;
    
    CGAffineTransform currentTransform = self.imageView.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, scale, scale);
    [self.imageView setTransform:newTransform];
    
    _lastScale = [sender scale];
}

float _lastRotation = 0.0;
- (void)rotateImage:(UIRotationGestureRecognizer *)sender
{
    if([sender state] == UIGestureRecognizerStateEnded) {
        
        _lastRotation = 0.0;
        return;
    }
    
    CGFloat rotation = -_lastRotation + [sender rotation];
    
    CGAffineTransform currentTransform = self.imageView.transform;
    CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform,rotation);
    [self.imageView setTransform:newTransform];
    
    _lastRotation = [sender rotation];
    
}
*/
@end
