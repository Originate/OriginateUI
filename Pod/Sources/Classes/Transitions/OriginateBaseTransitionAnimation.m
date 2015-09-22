//
//  PKBaseTransitionAnimation.m
//  OriginateUI
//
//  Created by Philip Kluz on 7/31/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "OriginateBaseTransitionAnimation.h"

@implementation OriginateBaseTransitionAnimation

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    NSAssert(NO, @"animateTransition: should be handled by subclass of BaseAnimation");
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.25;
}

@end
