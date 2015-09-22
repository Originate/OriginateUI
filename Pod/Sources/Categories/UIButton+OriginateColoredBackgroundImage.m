//
//  UIButton+OriginateBackgroundColors.m
//  OriginateUI
//
//  Created by Allen Wu on 7/23/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "UIButton+OriginateColoredBackgroundImage.h"

@implementation UIButton (OriginateColoredBackgroundImage)

- (void)setBackgroundImageWithColor:(UIColor *)color
                           forState:(UIControlState)state
{
    [self setBackgroundImage:[self imageWithColor:color]
                    forState:state];
}

- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0, 0.0, 1.0, 1.0);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
