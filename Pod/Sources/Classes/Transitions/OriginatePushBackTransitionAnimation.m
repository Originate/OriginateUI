//
//  OriginateBaseTransitionAnimation.m
//  OriginateUI
//
//  Created by Philip Kluz on 7/31/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "OriginatePushBackTransitionAnimation.h"

@implementation OriginatePushBackTransitionAnimation

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *container = [transitionContext containerView];
    container.backgroundColor = [UIColor blackColor];
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    if (self.type == OriginateAnimationTypePresent) {
        [container addSubview:fromVC.view];
        [container addSubview:toVC.view];
        
        toVC.view.frame = CGRectOffset(fromVC.view.bounds, 0.0, CGRectGetHeight(fromVC.view.bounds));
        fromVC.view.frame = fromVC.view.bounds;
        fromVC.view.alpha = 1.0;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^
         {
             fromVC.view.transform = CGAffineTransformMakeScale(0.8, 0.8);
             fromVC.view.alpha = 0.5;
             toVC.view.frame = toVC.view.bounds;
         }
                         completion:^(BOOL finished) {
             [transitionContext completeTransition:finished];
         }];
    }
    else if (self.type == OriginateAnimationTypeDismiss) {
        [container insertSubview:toVC.view belowSubview:fromVC.view];
        
        toVC.view.transform = CGAffineTransformMakeScale(0.8, 0.8);
        toVC.view.alpha = 0.5;
        fromVC.view.frame = fromVC.view.bounds;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
             toVC.view.transform = CGAffineTransformIdentity;
             toVC.view.alpha = 1.0;
             fromVC.view.frame = CGRectOffset(toVC.view.bounds, 0.0, CGRectGetHeight(toVC.view.bounds));
         }
                         completion:^(BOOL finished) {
             [transitionContext completeTransition:finished];
         }];
    }
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.35;
}

@end
