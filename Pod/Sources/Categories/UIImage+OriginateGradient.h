//
//  UIViewController+OriginateGradient.h
//  OriginateUI
//
//  Created by Robert Weindl on 2016-08-18.
//  Copyright © 2015 Originate, Inc. All rights reserved.
//

@import UIKit;

@interface UIImage (OriginateGradient)

#pragma mark - Methods
+ (instancetype)gradientImageWithSize:(CGSize)size firstColor:(UIColor *)firstColor secondColor:(UIColor *)secondColor;

@end
