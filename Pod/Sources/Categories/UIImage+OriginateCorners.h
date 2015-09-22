//
//  UIImage+OriginateCorners.h
//  OriginateUI
//
//  Created by Philip Kluz on 6/18/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

@import UIKit;

@interface UIImage (OriginateCorners)

#pragma mark - Properties
- (UIImage *)imageByRoundingCornersToRadius:(CGFloat)radius;

@end
