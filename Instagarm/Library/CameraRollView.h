//
//  CameraRollView.h
//  Instagarm
//
//  Created by AlexWang on 3/4/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyAlbumPicker.h"
#import "GarmEditView.h"

@interface CameraRollView : UIView

@property (strong, nonatomic) IBOutlet UIButton *btnCheck;
@property (strong, nonatomic) IBOutlet UIButton *btnDelete;
@property (strong, nonatomic) IBOutlet UIImageView *selectedImageView;
@property (strong, nonatomic) UIImage *originalImage;
@property (nonatomic) BOOL isChecked;
@property (strong, nonatomic) GarmEditView *garmEditView;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewBackground;


- (IBAction)btnCheck:(id)sender;
- (IBAction)btnDelete:(id)sender;

- (void)initInterface;

@end
