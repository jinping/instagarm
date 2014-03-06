//
//  MyImagePicker.h
//  Instagarm
//
//  Created by AlexWang on 3/4/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface MyImagePicker : UIView<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) ALAssetsGroup *assetGroup;
@property (strong, nonatomic) NSMutableArray *assetArray;
@property (strong, nonatomic) IBOutlet UITableView *thumbTableView;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewBackground;

- (void)initInterface;
- (void)setSelectImage:(NSInteger)index;

@end
