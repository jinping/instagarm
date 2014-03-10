//
//  InstagarmAppDelegate.h
//  Instagarm
//
//  Created by AlexWang on 3/3/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GarmObject.h"

@interface InstagarmAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *viewController;
@property (strong, nonatomic) GarmObject *garment;

+ (InstagarmAppDelegate*)sharedInstance;

@end
