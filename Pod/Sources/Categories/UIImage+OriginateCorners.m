//
//  UIImage+OriginateCorners.m
//  OriginateUI
//
//  Created by Philip Kluz on 6/18/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "UIImage+OriginateCorners.h"

@implementation UIImage (OriginateCorners)

- (UIImage *)imageByRoundingCornersToRadius:(CGFloat)radius
{
    CGRect imageRect = CGRectZero;
    imageRect.size = self.size;
    
    UIGraphicsBeginImageContextWithOptions(imageRect.size, NO, 0.0);
    
    UIBezierPath *rect = [UIBezierPath bezierPathWithRoundedRect:imageRect
                                                           cornerRadius:floorf(radius)];
    
    [rect addClip];
    [self drawInRect:imageRect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end
