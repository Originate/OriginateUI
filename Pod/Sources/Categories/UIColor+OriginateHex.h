//
//  UIImage+OriginateHex.h
//  OriginateUI
//
//  Created by Philip Kluz on 6/17/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

@import UIKit;

@interface UIColor (OriginateHex)

#pragma mark - Methods
+ (instancetype)colorWithHexString:(NSString *)hexString;
+ (NSString *)hexStringWithColor:(UIColor *)color;

+ (instancetype)hex:(NSInteger)hexColor;
+ (instancetype)hex:(NSInteger)hexColor alpha:(CGFloat)alpha;

@end
