//
//  ChooseInstagarmViewController.h
//  Instagarm
//
//  Created by AlexWang on 3/3/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GarmChooseView.h"
#import "CameraRollView.h"
#import "MyAlbumPicker.h"

@interface ChooseInstagarmViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *btnGarm;
@property (strong, nonatomic) IBOutlet UIButton *btnGallory;
@property (strong, nonatomic) IBOutlet UIButton *btnEditGarm;
@property (strong, nonatomic) IBOutlet UIButton *btnOrder;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UIButton *btnBack;

@property (strong, nonatomic) GarmChooseView *chooseView;
@property (strong, nonatomic) CameraRollView *cameraRollView;
@property (strong, nonatomic) MyAlbumPicker *albumPicker;

- (IBAction)btnBack:(id)sender;
- (IBAction)btnGarm:(id)sender;
- (IBAction)btnGallory:(id)sender;
- (IBAction)btnEditGarm:(id)sender;
- (IBAction)btnOrder:(id)sender;

- (void)setPreviousViewStatus:(UIView*)theView;

@end
