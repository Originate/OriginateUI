//
//  UIImage+OriginateMotionInterpolation.h
//  OriginateUI
//
//  Created by Philip Kluz on 6/15/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

@import UIKit;

@interface UIView (OriginateMotionInterpolation)

#pragma mark - Properties
@property (nonatomic, assign, readwrite, getter = isMotionInterpolationEnabled) BOOL motionInterpolationEnabled;

@end
