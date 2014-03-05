//
//  CameraRollView.h
//  Instagarm
//
//  Created by AlexWang on 3/4/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyAlbumPicker.h"

@interface CameraRollView : UIView

@property (strong, nonatomic) IBOutlet UIButton *btnCheck;
@property (strong, nonatomic) IBOutlet UIButton *btnDelete;
@property (strong, nonatomic) IBOutlet UIImageView *selectedImageView;
@property (nonatomic) BOOL isChecked;

- (IBAction)btnCheck:(id)sender;
- (IBAction)btnDelete:(id)sender;

- (void)initInterface;

@end
