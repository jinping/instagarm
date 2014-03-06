//
//  MyAlbumPicker.m
//  Instagarm
//
//  Created by AlexWang on 3/4/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import "MyAlbumPicker.h"
#import "pickerTableCell.h"
#import "MyImagePicker.h"
#import "InstagarmAppDelegate.h"

@implementation MyAlbumPicker

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
    self.pickerTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.pickerTableView setBackgroundColor:[UIColor colorWithRed:221.0/255.0 green:220.0/255.0 blue:208.0/255.0 alpha:1.0]];
    
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
	self.assetGroups = tempArray;
    
    ALAssetsLibrary *assetLibrary = [[ALAssetsLibrary alloc] init];
    self.library = assetLibrary;
    
    // Load Albums into assetGroups
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       @autoreleasepool {
                           
                           // Group enumerator Block
                           void (^assetGroupEnumerator)(ALAssetsGroup *, BOOL *) = ^(ALAssetsGroup *group, BOOL *stop)
                           {
                               if (group == nil) {
                                   return;
                               }
                               
                               // added fix for camera albums order
                               NSString *sGroupPropertyName = (NSString *)[group valueForProperty:ALAssetsGroupPropertyName];
                               NSUInteger nType = [[group valueForProperty:ALAssetsGroupPropertyType] intValue];
                               
                               if ([[sGroupPropertyName lowercaseString] isEqualToString:@"camera roll"] && nType == ALAssetsGroupSavedPhotos) {
                                   [self.assetGroups insertObject:group atIndex:0];
                               }
                               else {
                                   [self.assetGroups addObject:group];
                               }
                               
                               // Reload albums
                               [self performSelectorOnMainThread:@selector(reloadTableView) withObject:nil waitUntilDone:YES];
                           };
                           
                           // Group Enumerator Failure Block
                           void (^assetGroupEnumberatorFailure)(NSError *) = ^(NSError *error) {
                               
                               UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[NSString stringWithFormat:@"Album Error: %@ - %@", [error localizedDescription], [error localizedRecoverySuggestion]] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                               [alert show];
                               
                               NSLog(@"A problem occured %@", [error description]);	                                 
                           };	
                           
                           // Enumerate Albums
                           [self.library enumerateGroupsWithTypes:ALAssetsGroupAll
                                                       usingBlock:assetGroupEnumerator 
                                                     failureBlock:assetGroupEnumberatorFailure];
                           
                       }
                   });
}
- (void)reloadTableView
{
    [self.pickerTableView reloadData];
}
#pragma TableView datasource and delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.assetGroups count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 86;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"pickerTableCell";
    
    pickerTableCell *cell = (pickerTableCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *topObjects = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
        for (id obj in topObjects) {
            if ([obj isKindOfClass:[pickerTableCell class]]){
                cell = (pickerTableCell*)obj;
                break;
            }
        }
    }
    
    // Get count
    ALAssetsGroup *g = (ALAssetsGroup*)[self.assetGroups objectAtIndex:indexPath.row];
    [g setAssetsFilter:[ALAssetsFilter allPhotos]];
    NSInteger gCount = [g numberOfAssets];
    
    cell.lblTitle.text = [NSString stringWithFormat:@"%@\r\n %ld",[g valueForProperty:ALAssetsGroupPropertyName], (long)gCount];
    [cell.lblTitle setFont:[UIFont fontWithName:@"Aleo-regular" size:17.0f]];
    
    [cell.imageView setImage:[UIImage imageWithCGImage:[(ALAssetsGroup*)[self.assetGroups objectAtIndex:indexPath.row] posterImage]]];
	
    return cell;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyImagePicker *imagePicker;
    NSArray *obj = [[NSBundle mainBundle] loadNibNamed:@"MyImagePickerView" owner:self options:nil];
    for(UIView *view in obj)
    {
        if([view isKindOfClass:[MyImagePicker class]])
        {
            imagePicker = (MyImagePicker*)view;
            break;
        }
    }
    imagePicker.assetGroup = [self.assetGroups objectAtIndex:indexPath.row];
    [imagePicker.assetGroup setAssetsFilter:[ALAssetsFilter allPhotos]];
    [imagePicker initInterface];
    
    [imagePicker setFrame:CGRectMake(320, 88, 320, 480)];
    [[InstagarmAppDelegate sharedInstance].viewController.view addSubview:imagePicker];
    imagePicker.tag = 1002;
    
    [UIView beginAnimations:@"left" context:nil];
    [UIView animateWithDuration:1.0 animations:nil];
    [imagePicker setFrame:CGRectMake(0, 88, 320, 480)];
    [UIView commitAnimations];
    
    [self.imageViewBackground setHidden:YES];
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
