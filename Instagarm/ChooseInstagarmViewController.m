//
//  ChooseInstagarmViewController.m
//  Instagarm
//
//  Created by AlexWang on 3/3/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import "ChooseInstagarmViewController.h"
#import "GarmObject.h"
#import "GarmChooseView.h"
#import "MyImagePicker.h"
#import "InstagarmAppDelegate.h"

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
}
- (void)viewWillAppear:(BOOL)animated
{
    [InstagarmAppDelegate sharedInstance].viewController = self;
    [self loadGarmChooseView];
    [self.chooseView initInterface];
    self.chooseView.tag = 1000;
    
    [self.lblTitle setFont:[UIFont fontWithName:@"Aleo-Bold" size:17.0f]];
    [self.lblTitle setTextColor:[UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0]];
    NSUserDefaults *btnStatus = [NSUserDefaults standardUserDefaults];
    
    BOOL btnGarmStatus = [btnStatus boolForKey:@"GarmChoose"];
    [self.btnGarm setImage:[UIImage imageNamed:(btnGarmStatus?@"btnGarmChecked.png":@"btnGarm.png")] forState:UIControlStateNormal];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setButtonStatus
{
    NSUserDefaults *btnStatus = [NSUserDefaults standardUserDefaults];
    BOOL isGarmChoose = [btnStatus boolForKey:@"GarmChoose"];
//    BOOL isPhoto = [btnStatus boolForKey:@"Photo"];
//    BOOL isGarmEdit = [btnStatus boolForKey:@"GarmEdit"];
    
    [self.btnGarm setImage:[UIImage imageNamed:(isGarmChoose?@"btnGarmChecked.png":@"btnGarm.png")] forState:UIControlStateNormal];
}
- (void)loadGarmChooseView
{
    NSArray *obj = [[NSBundle mainBundle] loadNibNamed:@"GarmChooseView" owner:self options:nil];
    for(UIView *view in obj)
    {
        if([view isKindOfClass:[GarmChooseView class]])
        {
            self.chooseView = (GarmChooseView*)view;
        }
    }
    [self.chooseView setFrame:CGRectMake(320, 88, 320, 480)];
    [self.view addSubview:self.chooseView];
    
    [UIView beginAnimations:@"left" context:nil];
    [UIView animateWithDuration:1.0 animations:nil];
    [self.chooseView setFrame:CGRectMake(0, 88, 320, 480)];
    [UIView commitAnimations];
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
    [self.view addSubview:self.albumPicker];
    
    [UIView beginAnimations:@"left" context:nil];
    [UIView animateWithDuration:1.0 animations:nil];
    [self.albumPicker setFrame:CGRectMake(0, 88, 320, 480)];
    [UIView commitAnimations];
}

- (void)loadCameraRollView
{
    NSArray *obj = [[NSBundle mainBundle] loadNibNamed:@"CameraRollView" owner:self options:nil];
    for(UIView *view in obj)
    {
        if([view isKindOfClass:[CameraRollView class]])
        {
            self.cameraRollView = (CameraRollView*)view;
            break;
        }
    }
    [self.cameraRollView setFrame:CGRectMake(320, 88, 320, 480)];
    [self.view addSubview:self.cameraRollView];
    
    [UIView beginAnimations:@"left" context:nil];
    [UIView animateWithDuration:1.0 animations:nil];
    [self.cameraRollView setFrame:CGRectMake(0, 88, 320, 480)];
    [UIView commitAnimations];
}
- (void)removeSubViews
{
    GarmChooseView *chooseView = (GarmChooseView*)[self.view viewWithTag:1000];
    if(chooseView)
    {
        [chooseView removeFromSuperview];
    }
    MyAlbumPicker *picker = (MyAlbumPicker*)[self.view viewWithTag:1001];
    if(picker)
    {
        for(UIView *view in picker.subviews)
        {
            [view removeFromSuperview];
        }
        [picker removeFromSuperview];
    }
    MyImagePicker *imagePicker = (MyImagePicker*)[self.view viewWithTag:1002];
    if(imagePicker)
    {
        [imagePicker removeFromSuperview];
    }
    CameraRollView *cameraView = (CameraRollView*)[self.view viewWithTag:1003];
    if(cameraView)
    {
        [cameraView removeFromSuperview];
    }
}
#pragma Actions
- (IBAction)btnBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnGarm:(id)sender
{
    [self removeSubViews];
    [self loadGarmChooseView];
    [self.chooseView initInterface];
    self.chooseView.tag = 1000;
}

- (IBAction)btnGallory:(id)sender
{
    [self removeSubViews];
    [self loadAlbumPicker];
    [self.albumPicker initInterface];
    self.albumPicker.tag = 1001;
    [self setButtonStatus];
    [self.btnGallory setImage:[UIImage imageNamed:@"btnGallaryActive.png"] forState:UIControlStateNormal];
    
}

- (IBAction)btnEditGarm:(id)sender {
}

- (IBAction)btnOrder:(id)sender {
}

@end
