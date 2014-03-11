//
//  MyTextField.m
//  Instagarm
//
//  Created by AlexWang on 3/12/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import "MyTextField.h"

@implementation MyTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void) drawPlaceholderInRect:(CGRect)rect  {
    
    if (self.placeholder)
    {
        
        // color of placeholder text
        UIColor *placeHolderTextColor = [UIColor colorWithRed:164.0/255.0 green:163.0/255.0 blue:154.0/255.0 alpha:1.0];
        CGSize drawSize = [self.placeholder sizeWithAttributes:[NSDictionary dictionaryWithObject:self.font forKey:NSFontAttributeName]];
        CGRect drawRect = rect;
        
        // verticially align text
        drawRect.origin.y = (rect.size.height - drawSize.height) * 0.5;
        
        // set alignment
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.alignment = self.textAlignment;
        
        //set Font
        self.font = [UIFont fontWithName:@"Aleo-Regular" size:17.0f];
        
        // dictionary of attributes, font, paragraphstyle, and color
        NSDictionary *drawAttributes = @{NSFontAttributeName: self.font,
                                         NSParagraphStyleAttributeName : paragraphStyle,
                                         NSForegroundColorAttributeName : placeHolderTextColor};
        
        
        // draw
        [self.placeholder drawInRect:drawRect withAttributes:drawAttributes];
        
    }
    
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
