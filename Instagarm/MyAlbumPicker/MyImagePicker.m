//
//  MyImagePicker.m
//  Instagarm
//
//  Created by AlexWang on 3/4/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import "MyImagePicker.h"
#import "ThumbTableCell.h"
#import "CameraRollView.h"
#import "InstagarmAppDelegate.h"

@implementation MyImagePicker

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
    self.assetArray = [[NSMutableArray alloc] init];
    [self preparePhotos];
    self.thumbTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}
- (void)preparePhotos
{
    @autoreleasepool {
        
        [self.assetGroup enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            
            if (result == nil) {
                return;
            }
             if([[result valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypePhoto])
             {
                 [self.assetArray addObject:result];
             }
             [self performSelectorOnMainThread:@selector(reloadTableView) withObject:nil waitUntilDone:YES];
        }];
        
    }
}
- (void)reloadTableView
{
    [self.thumbTableView reloadData];
}
- (void)dealloc
{
    self.assetArray = nil;
}
#pragma NSNotification
- (void)setSelectImage:(NSInteger)index
{
    
    NSInteger selectedIndex = index;
    
    ALAsset *asset = (ALAsset*)[self.assetArray objectAtIndex:selectedIndex];
    ALAssetRepresentation *rawImage = [asset defaultRepresentation];
    UIImage *image = [UIImage imageWithCGImage:[rawImage fullScreenImage]];
    
    [self loadCameraRollView:image];
}
- (void)loadCameraRollView:(UIImage*)image
{
    CameraRollView *cameraRollView;
    
    NSArray *obj = [[NSBundle mainBundle] loadNibNamed:@"CameraRollView" owner:self options:nil];
    for(UIView *view in obj)
    {
        if([view isKindOfClass:[CameraRollView class]])
        {
            cameraRollView = (CameraRollView*)view;
            break;
        }
    }
    cameraRollView.originalImage = image;
    [cameraRollView setFrame:CGRectMake(320, 88, 320, 480)];
    cameraRollView.tag = 1003;
    [cameraRollView initInterface];
    [[InstagarmAppDelegate sharedInstance].viewController.view addSubview:cameraRollView];
    
    [UIView beginAnimations:@"left" context:nil];
    [UIView animateWithDuration:1.0 animations:nil];
    [cameraRollView setFrame:CGRectMake(0, 88, 320, 480)];
    [UIView commitAnimations];
    
    [self.imageViewBackground setHidden:YES];
}

- (NSArray *)assetsForIndexPath:(NSIndexPath *)path
{
    long index = path.row * 3;
    long length = MIN(3, [self.assetArray count] - index);
    return [self.assetArray subarrayWithRange:NSMakeRange(index, length)];
}

#pragma Tableview datasource and delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return round(self.assetArray.count/3);
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 107.0f;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ThumbTableCell";
    ThumbTableCell *cell = (ThumbTableCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *topObjects = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
        for (id obj in topObjects) {
            if ([obj isKindOfClass:[ThumbTableCell class]]){
                cell = (ThumbTableCell*)obj;
                break;
            }
        }
    }
    cell.indexPath = indexPath;
    cell.parent = self;
    [cell setAsset:[self assetsForIndexPath:indexPath]];
    return cell;
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
