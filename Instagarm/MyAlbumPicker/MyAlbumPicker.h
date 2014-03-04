//
//  MyAlbumPicker.h
//  Instagarm
//
//  Created by AlexWang on 3/4/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface MyAlbumPicker : UIView<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *pickerTableView;
@property (strong, nonatomic) NSMutableArray *assetGroups;
@property (strong, nonatomic) ALAssetsLibrary *library;

- (void)initInterface;

@end
