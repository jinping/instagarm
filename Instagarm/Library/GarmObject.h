//
//  GarmObject.h
//  Instagarm
//
//  Created by AlexWang on 3/3/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GarmObject : NSObject

@property (strong, nonatomic) NSString *garmName;
@property (strong, nonatomic) NSString *garmPrice;
@property (strong, nonatomic) NSString *garmImageName;
@property (strong, nonatomic) UIImageView *garmImage;

@end
