//
//  UIImage+OriginateMotionInterpolation.m
//  OriginateUI
//
//  Created by Philip Kluz on 6/15/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "UIView+OriginateMotionInterpolation.h"

#define DEFAULT_MOTION_INTERPOLATION_RELATIVE_VALUE 15.0

@implementation UIView (OriginateMotionInterpolation)

- (BOOL)isMotionInterpolationEnabled
{
    __block BOOL isEnabled = NO;
    NSArray *effects = self.motionEffects;
    [effects enumerateObjectsUsingBlock:^(UIInterpolatingMotionEffect *effect, NSUInteger idx, BOOL *stop) {
         if ([effect.keyPath hasPrefix:@"center"]) {
             isEnabled = YES;
             *stop = YES;
         }
     }];
    
    return isEnabled;
}

- (void)setMotionInterpolationEnabled:(BOOL)motionInterpolationEnabled
{
    if (motionInterpolationEnabled) {
        UIInterpolatingMotionEffect *horizontal = ({
            UIInterpolatingMotionEffect *effect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"
                                                                                                  type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
            effect.maximumRelativeValue = @(DEFAULT_MOTION_INTERPOLATION_RELATIVE_VALUE);
            effect.minimumRelativeValue = @(-DEFAULT_MOTION_INTERPOLATION_RELATIVE_VALUE);
            effect;
        });
        
        UIInterpolatingMotionEffect *vertical = ({
            UIInterpolatingMotionEffect *effect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y"
                                                                                                  type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
            effect.minimumRelativeValue = @(-DEFAULT_MOTION_INTERPOLATION_RELATIVE_VALUE);
            effect.maximumRelativeValue = @(DEFAULT_MOTION_INTERPOLATION_RELATIVE_VALUE);
            effect;
        });
        
        UIMotionEffectGroup *group = [[UIMotionEffectGroup alloc] init];
        group.motionEffects = @[ horizontal, vertical ];
        
        [self addMotionEffect:group];
    }
    else {
        if ([self isMotionInterpolationEnabled]) {
            NSMutableArray *mutableEffects = [self.motionEffects mutableCopy];
            [self.motionEffects enumerateObjectsUsingBlock:^(UIInterpolatingMotionEffect *effect, NSUInteger idx, BOOL *stop) {
                 if ([effect.keyPath hasPrefix:@"center"]) {
                     [mutableEffects removeObject:effect];
                 }
             }];
        }
    }
}

@end
