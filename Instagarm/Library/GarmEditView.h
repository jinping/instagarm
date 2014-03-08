//
//  GarmEditView.h
//  Instagarm
//
//  Created by AlexWang on 3/6/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "brandView.h"

@interface GarmEditView : UIView
{
    BOOL isDone;
    BOOL isPan;
    CGAffineTransform oldTransform;
    CGFloat lastRotation;
}
@property (strong, nonatomic) IBOutlet UIImageView *editImageView;
@property (strong, nonatomic) IBOutlet UIImageView *editBackImageView;
@property (strong, nonatomic) IBOutlet UIButton *btnCheck;
@property (strong, nonatomic) IBOutlet UIButton *btnDelete;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewBackground;
@property (strong, nonatomic) IBOutlet UIImageView *garmImageView;
@property (strong, nonatomic) IBOutlet brandView *brand;

@property (strong, nonatomic) UIRotationGestureRecognizer *rotationGesture;
@property (strong, nonatomic) UIPanGestureRecognizer *panGesture;
@property (strong, nonatomic) UIPinchGestureRecognizer *pinchGesture;

- (void)initInterface;

- (IBAction)btnCheck:(id)sender;
- (IBAction)btnDelete:(id)sender;

@end
