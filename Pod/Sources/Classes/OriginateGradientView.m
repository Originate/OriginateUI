//
//  OriginateGradientView.m
//  OriginateUI
//
//  Created by Philip Kluz on 7/2/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "OriginateGradientView.h"

@implementation OriginateGradientView

@synthesize firstColor = _firstColor;
@synthesize secondColor = _secondColor;

#pragma mark - OriginateGradientView

- (instancetype)initWithFirstColor:(UIColor *)firstColor secondColor:(UIColor *)secondColor
{
    self = [super init];
    
    if (self) {
        _firstColor = firstColor;
        _secondColor = secondColor;
        self.backgroundColor = [UIColor clearColor];
        [self.layer addSublayer:self.gradientLayer];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.gradientLayer.frame = self.bounds;
}

+ (CAGradientLayer *)gradientLayerWithFirstColor:(UIColor *)firstColor
                                     secondColor:(UIColor *)secondColor
{
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.colors = @[(id)firstColor.CGColor, (id)secondColor.CGColor];
    layer.locations = @[@0.0, @0.8];
    return layer;
}

- (CAGradientLayer *)gradientLayer
{
    if (!_gradientLayer) {
        _gradientLayer = [[self class] gradientLayerWithFirstColor:self.firstColor
                                                       secondColor:self.secondColor];
    }
    
    return _gradientLayer;
}

- (void)setFirstColor:(UIColor *)firstColor
{
    _firstColor = firstColor;
    [self.gradientLayer removeFromSuperlayer];
    self.gradientLayer = [[self class] gradientLayerWithFirstColor:_firstColor
                                                       secondColor:self.secondColor];
    [self.layer addSublayer:self.gradientLayer];
}

- (UIColor *)firstColor
{
    if (!_firstColor) {
        _firstColor = [UIColor whiteColor];
    }
    return _firstColor;
}

- (void)setSecondColor:(UIColor *)secondColor
{
    _secondColor = secondColor;
    [self.gradientLayer removeFromSuperlayer];
    self.gradientLayer = [[self class] gradientLayerWithFirstColor:self.firstColor
                                                       secondColor:_secondColor];
    [self.layer addSublayer:self.gradientLayer];
}

- (UIColor *)secondColor
{
    if (!_secondColor) {
        _secondColor = [UIColor blackColor];
    }
    return _secondColor;
}

@end
