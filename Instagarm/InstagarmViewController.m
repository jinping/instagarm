//
//  InstagarmViewController.m
//  Instagarm
//
//  Created by AlexWang on 3/3/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import "InstagarmViewController.h"
#import "ChooseInstagarmViewController.h"

@interface InstagarmViewController ()

@end

@implementation InstagarmViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self customizeNavigation];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandle)];
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)customizeNavigation
{
    [self.navigationController setNavigationBarHidden:YES];
}
- (void)tapHandle
{
   UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
   ChooseInstagarmViewController *CIVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"ChooseInstagarm"];
   [self.navigationController pushViewController:CIVC animated:YES];
}
@end
