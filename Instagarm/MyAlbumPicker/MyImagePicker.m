//
//  MyImagePicker.m
//  Instagarm
//
//  Created by AlexWang on 3/4/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import "MyImagePicker.h"
#import "ThumbImage.h"

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
        }];
        
    }
   [self.pickerScrollView setContentSize:CGSizeMake(320, self.assetArray.count * 105 / 3)];
   [self loadPhotos:self.assetArray];
   
}
- (void)loadPhotos:(NSMutableArray*)assetArray
{
    for(int i= 0; i < assetArray.count; i++)
    {
        ALAsset *asset = (ALAsset*)[assetArray objectAtIndex:i];
        ThumbImage *thumb = [self getThumbImage];
        
        thumb.thumbImage.image = [UIImage imageWithCGImage:[asset thumbnail]];
        ALAssetRepresentation *rawImage = [asset defaultRepresentation];
        thumb.fullImage = [UIImage imageWithCGImage:[rawImage fullScreenImage]];
        NSInteger idxX = i % 3;
        NSInteger idxY = round(i / 3);
        [thumb setFrame:CGRectMake(idxX * 105 + (idxX != 0?2.5 * idxX:0), idxY * 105 + idxY * 2, 105, 105)];
        thumb.tag = i;
        [self.pickerScrollView addSubview:thumb];
        rawImage = nil;
    }
    self.assetArray = nil;
}
- (ThumbImage*)getThumbImage
{
    ThumbImage *thumb;
    NSArray *obj = [[NSBundle mainBundle] loadNibNamed:@"ThumbImage" owner:self options:nil];
    for(UIView *view in obj)
    {
        if([view isKindOfClass:[ThumbImage class]])
        {
            thumb = (ThumbImage*)view;
            break;
        }
    }
    return thumb;
}
- (void)dealloc
{
    self.assetArray = nil;
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
