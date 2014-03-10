//
//  ThumbTableCell.h
//  Instagarm
//
//  Created by AlexWang on 3/5/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyImagePicker.h"

@interface ThumbTableCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *thumbImage1;
@property (strong, nonatomic) IBOutlet UIImageView *thumbImage2;
@property (strong, nonatomic) IBOutlet UIImageView *thumbImage3;
@property (strong, nonatomic) NSIndexPath *indexPath;
@property (strong, nonatomic) MyImagePicker *parent;

- (void)setAsset:(NSArray*)asset;

@end
