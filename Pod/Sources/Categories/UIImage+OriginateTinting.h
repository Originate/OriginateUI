//
//  UIImage+OriginateTinting.h
//  OriginateUI
//
//  Created by Philip Kluz on 6/14/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

@import UIKit;

@interface UIImage (OriginateTinting)

#pragma mark - Methods
- (UIImage *)imageTintedWithColor:(UIColor *)color;
- (UIImage *)imageTintedWithColor:(UIColor *)color
                         fraction:(CGFloat)fraction;

@end
