//
//  UIImage+OriginateCircularImage.h
//  OriginateUI
//
//  Created by Philip Kluz on 6/14/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

@import UIKit;


@interface UIImage (OriginateCircularImage)

#pragma mark - Methods
+ (UIImage *)circularImageWithText:(NSString *)text
                         textColor:(UIColor *)textColor
                   backgroundColor:(UIColor *)backgroundColor
                              size:(CGSize)size;

- (UIImage *)circularImageWithBorderWidth:(CGFloat)borderWidth
                              borderColor:(UIColor *)borderColor;

@end
