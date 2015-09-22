//
//  UIImage+OriginateTinting.m
//  OriginateUI
//
//  Created by Philip Kluz on 6/14/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "UIImage+OriginateTinting.h"

@implementation UIImage (OriginateTinting)

- (UIImage *)imageTintedWithColor:(UIColor *)color
{
    return [self imageTintedWithColor:color fraction:0.0];
}

- (UIImage *)imageTintedWithColor:(UIColor *)tintColor fraction:(CGFloat)fraction
{
    if (!tintColor) {
        return self;
    }
    
    UIImage *result;
    
    UIGraphicsBeginImageContextWithOptions([self size], NO, 0.0);
    
    CGRect rect = CGRectZero;
    rect.size = [self size];
    
    [tintColor set];
    UIRectFill(rect);
    
    [self drawInRect:rect
           blendMode:kCGBlendModeDestinationIn
               alpha:1.0];
    
    if (fraction > 0.0)
    {
        [self drawInRect:rect
               blendMode:kCGBlendModeSourceAtop
                   alpha:fraction];
    }
    
    result = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return result;
}

@end
