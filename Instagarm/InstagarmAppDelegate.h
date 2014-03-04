//
//  InstagarmAppDelegate.h
//  Instagarm
//
//  Created by AlexWang on 3/3/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstagarmAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *viewController;

+ (InstagarmAppDelegate*)sharedInstance;

@end
