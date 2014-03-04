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
    
    [self.lblGarm setFont:[UIFont fontWithName:@"Aleo-Regular" size:22.0f]];
    [self.lblPrice setFont:[UIFont fontWithName:@"Aleo-Regular" size:22.0f]];
    [self.lblGarmTitle setFont:[UIFont fontWithName:@"Franklin Gothic Medium" size:11.0f]];
    [self.lblPriceTitle setFont:[UIFont fontWithName:@"Franklin Gothic Medium" size:11.0f]];
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
        [obj.garmImage setFrame:CGRectMake(i * 320 + 25*(i+1), 15, 320 - 25*(i +1) * 2, 337)];
        [self.scrollViewGarm addSubview:obj.garmImage];
    }
}
#pragma scrollview data
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    GarmObject *obj = (GarmObject*)[garmList objectAtIndex:currentPage];
    self.lblGarm.text = [NSString stringWithFormat:@"£%@", obj.garmName];
    self.lblPrice.text = [NSString stringWithFormat:@"£%@", obj.garmPrice];
    
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
    }
    [btnStatus synchronize];

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
