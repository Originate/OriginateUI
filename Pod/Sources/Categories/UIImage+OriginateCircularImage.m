//
//  UIImage+OriginateCircularImage.m
//  OriginateUI
//
//  Created by Philip Kluz on 6/14/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "UIImage+OriginateCircularImage.h"

@implementation UIImage (OriginateCircularImage)

+ (UIImage *)circularImageWithText:(NSString *)text
                         textColor:(UIColor *)textColor
                   backgroundColor:(UIColor *)backgroundColor
                              size:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    CGRect contextRect = CGRectMake(0.0, 0.0, size.width, size.height);
    
    [backgroundColor setFill];
    
    UIBezierPath *circle = [UIBezierPath bezierPathWithOvalInRect:contextRect];
    [circle addClip];
    UIRectFill(contextRect);
    
    UILabel *label = [[UILabel alloc] initWithFrame:contextRect];
    label.text = text;
    label.font = [UIFont systemFontOfSize:ceilf(size.height / 2.0)];
    label.textColor = textColor;
    label.textAlignment = NSTextAlignmentCenter;
    [label drawRect:contextRect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    return image;
}

- (UIImage *)circularImageWithBorderWidth:(CGFloat)borderWidth
                              borderColor:(UIColor *)borderColor
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    CGRect contextRect = CGRectMake(0.0, 0.0, self.size.width, self.size.height);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *circle = [UIBezierPath bezierPathWithOvalInRect:contextRect];
    CGRect imageRect = contextRect;
    
    if (borderWidth > 0 && borderColor)
    {
        CGContextSaveGState(context);
        {
            UIBezierPath *outerCircle = [circle copy];
            [outerCircle addClip];
            [borderColor setFill];
            UIRectFill(contextRect);
            
            imageRect = CGRectInset(contextRect, borderWidth, borderWidth);
            circle = [UIBezierPath bezierPathWithOvalInRect:imageRect];
        }
        CGContextRestoreGState(context);
    }
    
    [circle addClip];
    [self drawInRect:imageRect
           blendMode:kCGBlendModeNormal
               alpha:1.0];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    return image;
}

@end
