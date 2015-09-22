//
//  PKBaseTransitionAnimation.h
//  OriginateUI
//
//  Created by Philip Kluz on 7/31/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

@import UIKit;

typedef NS_ENUM(NSUInteger, OriginateAnimationType) {
    OriginateAnimationTypePresent,
    OriginateAnimationTypeDismiss
};

@interface OriginateBaseTransitionAnimation : NSObject <UIViewControllerAnimatedTransitioning>

#pragma mark - Properties
@property (nonatomic, assign, readwrite) OriginateAnimationType type;

@end
