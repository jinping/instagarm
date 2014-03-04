//
//  GarmChooseView.m
//  Instagarm
//
//  Created by AlexWang on 3/3/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import "GarmChooseView.h"
#import "GarmObject.h"
#import "InstagarmAppDelegate.h"
#import "ChooseInstagarmViewController.h"
#import "CameraRollView.h"
#import "MyAlbumPicker.h"

@implementation GarmChooseView

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
    GarmObject *tmp1 = [self getGarmObject:@"White Tee" garmImageName:@"tshirt.png" garmPrice:@"25.99"];
    GarmObject *tmp2 = [self getGarmObject:@"Grey-Hoodie" garmImageName:@"grey_hoodie.png" garmPrice:@"45.99"];
    garmList = [[NSArray alloc] initWithObjects:tmp1, tmp2, nil];
    
    [self.scrollViewGarm setContentSize:CGSizeMake(320 * garmList.count, 367)];
    self.scrollViewGarm.scrollsToTop = NO;
    self.scrollViewGarm.delegate = self;
    
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = [garmList count];
    [self.pageControl addTarget:self action:@selector(changePage) forControlEvents:UIControlEventValueChanged];
    
    self.isChecked = NO;
    
    [self setGarmContent];
    
    UIColor *textColor = [UIColor colorWithRed:51.0 / 255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
    [self.lblGarm setFont:[UIFont fontWithName:@"Aleo-Regular" size:17.0f]];
    [self.lblGarm setTextColor:textColor];
    [self.lblPrice setFont:[UIFont fontWithName:@"Aleo-Regular" size:17.0f]];
    [self.lblPrice setTextColor:textColor];
    [self.lblGarmTitle setFont:[UIFont fontWithName:@"Franklin Gothic Medium" size:9.0f]];
    [self.lblGarmTitle setTextColor:textColor];
    [self.lblPriceTitle setFont:[UIFont fontWithName:@"Franklin Gothic Medium" size:9.0f]];
    [self.lblPriceTitle setTextColor:textColor];
}


- (GarmObject*)getGarmObject:(NSString*)garmName garmImageName:(NSString*)imageName garmPrice:(NSString*)price
{
    GarmObject *obj = [[GarmObject alloc] init];
    obj.garmName = garmName;
    obj.garmImageName = imageName;
    obj.garmPrice = price;
    
    if(obj.garmImageName != nil)
    {
        obj.garmImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:obj.garmImageName]];
    }
    return obj;
}
- (void)setGarmContent
{
    for(int i = 0; i < garmList.count; i++)
    {
        GarmObject *obj = (GarmObject*)[garmList objectAtIndex:i];
        [obj.garmImage setFrame:CGRectMake(i * 320 + 20*(i+1), 15, 320 - 20*(i +1) * 2, 357)];
        [self.scrollViewGarm addSubview:obj.garmImage];
    }
}
#pragma scrollview data
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    GarmObject *obj = (GarmObject*)[garmList objectAtIndex:currentPage];
    self.lblGarm.text = [NSString stringWithFormat:@"%@", obj.garmName];
    self.lblPrice.text = [NSString stringWithFormat:@"%@", obj.garmPrice];
    
    //To set pagecontroll
    self.pageControl.currentPage = currentPage;
}
- (void)changePage
{
    CGFloat x = self.pageControl.currentPage * self.scrollViewGarm.frame.size.width;
    [self.scrollViewGarm setContentOffset:CGPointMake(x, self.scrollViewGarm.contentOffset.y)];
}
- (IBAction)btnCheck:(id)sender
{
    NSUserDefaults *btnStatus = [NSUserDefaults standardUserDefaults];
    if(self.isChecked)
    {
        [self.btnCheck setImage:[UIImage imageNamed:@"btnUncheck.png"] forState:UIControlStateNormal];
        self.isChecked = NO;
        [btnStatus setBool:NO forKey:@"GarmChoose"];
    }
    else
    {
        [self.btnCheck setImage:[UIImage imageNamed:@"btnCheck.png"] forState:UIControlStateNormal];
        self.isChecked = YES;
        [btnStatus setBool:YES forKey:@"GarmChoose"];
        
        
        [self removeSubView];
        [self loadAlbumPicker];
        [self.albumPicker initInterface];
        self.albumPicker.tag = 1001;
        ChooseInstagarmViewController *civc = (ChooseInstagarmViewController*)[InstagarmAppDelegate sharedInstance].viewController;
        [civc.btnGallory setImage:[UIImage imageNamed:@"btnGallaryActive.png"] forState:UIControlStateNormal];
        [civc.btnGarm setImage:[UIImage imageNamed:@"btnGarmChecked.png"] forState:UIControlStateNormal];
    }
    [btnStatus synchronize];
    
    
}
- (void)removeSubView
{
    ChooseInstagarmViewController *civc = (ChooseInstagarmViewController*)[InstagarmAppDelegate sharedInstance].viewController;
    [civc removeSubViews];
}
- (void)loadAlbumPicker
{
    
    NSArray *obj = [[NSBundle mainBundle] loadNibNamed:@"MyAlbumPicker" owner:self options:nil];
    for(UIView *view in obj)
    {
        if([view isKindOfClass:[MyAlbumPicker class]])
        {
            self.albumPicker = (MyAlbumPicker*)view;
            break;
        }
    }
    [self.albumPicker setFrame:CGRectMake(320, 88, 320, 480)];
    [[InstagarmAppDelegate sharedInstance].viewController.view addSubview:self.albumPicker];
    
    [UIView beginAnimations:@"left" context:nil];
    [UIView animateWithDuration:1.0 animations:nil];
    [self.albumPicker setFrame:CGRectMake(0, 88, 320, 480)];
    [UIView commitAnimations];
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
