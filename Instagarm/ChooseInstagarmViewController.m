//
//  ChooseInstagarmViewController.m
//  Instagarm
//
//  Created by AlexWang on 3/3/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import "ChooseInstagarmViewController.h"
#import "GarmObject.h"

@interface ChooseInstagarmViewController ()

@end

@implementation ChooseInstagarmViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    GarmObject *tmp1 = [self getGarmObject:@"White Tee" garmImageName:@"tshirt.png" garmPrice:@"25.99"];
    GarmObject *tmp2 = [self getGarmObject:@"Grey-Hoodie" garmImageName:@"grey_hoodie.png" garmPrice:@"45.99"];
    garmList = [[NSArray alloc] initWithObjects:tmp1, tmp2, nil];
    
    [self.scrollViewGarm setContentSize:CGSizeMake(320 * garmList.count, 367)];
    self.scrollViewGarm.scrollsToTop = NO;
    self.scrollViewGarm.delegate = self;
    
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = [garmList count];
    [self.pageControl addTarget:self action:@selector(changePage) forControlEvents:UIControlEventValueChanged];
    
    isChecked = NO;
}
- (void)viewWillAppear:(BOOL)animated
{
    [self setGarmContent];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        [obj.garmImage setFrame:CGRectMake(i * 320 + 20, 15, 280, 337)];
        [self.scrollViewGarm addSubview:obj.garmImage];
    }
}
#pragma scrollview data
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    GarmObject *obj = (GarmObject*)[garmList objectAtIndex:currentPage];
    self.lblGarmName.text = obj.garmName;
    self.lblGarmPrice.text = obj.garmPrice;
    
    //To set pagecontroll
    self.pageControl.currentPage = currentPage;
}
- (void)changePage
{
    CGFloat x = self.pageControl.currentPage * self.scrollViewGarm.frame.size.width;
    [self.scrollViewGarm setContentOffset:CGPointMake(x, self.scrollViewGarm.contentOffset.y)];
}
#pragma Actions
- (IBAction)btnBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnGarm:(id)sender
{
    
}

- (IBAction)btnGallory:(id)sender {
}

- (IBAction)btnEditGarm:(id)sender {
}

- (IBAction)btnOrder:(id)sender {
}

- (IBAction)btnCheck:(id)sender
{
    if(isChecked)
    {
        [self.btnCheck setImage:[UIImage imageNamed:@"btnUncheck.png"] forState:UIControlStateNormal];
        isChecked = NO;
    }
    else
    {
        [self.btnCheck setImage:[UIImage imageNamed:@"btnCheck.png"] forState:UIControlStateNormal];
        isChecked = YES;
    }
}
@end
