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
    [self loadGarmChooseView];
    [self.chooseView initInterface];
    
    [self.lblTitle setFont:[UIFont fontWithName:@"Aleo-Bold" size:19.0f]];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    [self.chooseView setFrame:CGRectMake(320, 93, 320, 475)];
    [self.view addSubview:self.chooseView];
    
    [UIView beginAnimations:@"left" context:nil];
    [UIView animateWithDuration:0.7 animations:nil];
    [self.chooseView setFrame:CGRectMake(0, 93, 320, 475)];
    [UIView commitAnimations];
}
#pragma Actions
- (IBAction)btnBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnGarm:(id)sender
{
    [self loadGarmChooseView];
    [self.chooseView initInterface];
}

- (IBAction)btnGallory:(id)sender {
}

- (IBAction)btnEditGarm:(id)sender {
}

- (IBAction)btnOrder:(id)sender {
}

@end
