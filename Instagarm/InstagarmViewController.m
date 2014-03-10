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
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [self customizeNavigation];
    [self playMovie];
    [self addLogoImage];
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
- (void)playMovie
{
    NSBundle *thisBundle = [NSBundle bundleForClass:[self class]];
    NSString *filePath = [thisBundle pathForResource:@"app-bg" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    
    self.mpPlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
    [self.mpPlayer.view setFrame:CGRectMake(0, 0, 320, 568)];
    self.mpPlayer.controlStyle = MPMovieControlStyleNone;
    
    [self.view addSubview:self.mpPlayer.view];
    self.mpPlayer.repeatMode = 1;
    [self.mpPlayer play];
}
- (void)addLogoImage
{
    UIImageView *logoImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"instagarm-logo.png"]];
    [logoImage setFrame:CGRectMake(110, 250, 100, 100)];
    [self.view addSubview:logoImage];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ChooseInstagarmViewController *CIVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"ChooseInstagarm"];
    [self.navigationController pushViewController:CIVC animated:YES];
    
    self.mpPlayer = nil;
}
@end
