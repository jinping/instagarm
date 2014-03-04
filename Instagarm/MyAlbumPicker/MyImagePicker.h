//
//  MyImagePicker.h
//  Instagarm
//
//  Created by AlexWang on 3/4/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface MyImagePicker : UIView
@property (strong, nonatomic) IBOutlet UIScrollView *pickerScrollView;
@property (strong, nonatomic) ALAssetsGroup *assetGroup;
@property (strong, nonatomic) NSMutableArray *assetArray;

- (void)initInterface;

@end
