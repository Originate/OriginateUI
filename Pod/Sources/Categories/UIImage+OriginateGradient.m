//
//  UIViewController+OriginateGradient.m
//  OriginateUI
//
//  Created by Robert Weindl on 2016-08-18.
//  Copyright © 2015 Originate, Inc. All rights reserved.
//

#import "UIImage+OriginateGradient.h"

@implementation UIImage (OriginateGradient)

+ (instancetype)gradientImageWithSize:(CGSize)size firstColor:(UIColor *)firstColor secondColor:(UIColor *)secondColor
{
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = CGRectMake(0.0, 0.0, size.width, size.height);
    layer.colors = @[(__bridge id)firstColor.CGColor, (__bridge id)secondColor.CGColor];
    
    UIGraphicsBeginImageContext(size);
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
