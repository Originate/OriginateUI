//
//  OriginateGradientView.h
//  OriginateUI
//
//  Created by Philip Kluz on 7/2/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

@import UIKit;

IB_DESIGNABLE

@interface OriginateGradientView : UIView

#pragma mark - Properties
@property (nonatomic, strong, readwrite) IBInspectable UIColor *firstColor;
@property (nonatomic, strong, readwrite) IBInspectable UIColor *secondColor;
@property (nonatomic, strong, readwrite) CAGradientLayer *gradientLayer;

#pragma mark - Methods
- (instancetype)initWithFirstColor:(UIColor *)firstColor secondColor:(UIColor *)secondColor;

@end
