//
//  NSLayoutConstraint+AutoLayout.m
//  AutoLayout Extensions
//
//  Created by Aaron Daub on 2015-08-13.
//  Copyright (c) 2015 Aaron Daub. All rights reserved.
//  Licensed under MIT.

#import "NSLayoutConstraint+AutoLayout.h"

@implementation NSLayoutConstraint (AutoLayout)

+ (instancetype)constraintWithItem:(id)item attribute:(NSLayoutAttribute)attribute toItem:(id)secondItem {
  return [self constraintWithItem:item attribute:attribute relatedBy:NSLayoutRelationEqual toItem:secondItem attribute:attribute multiplier:1 constant:0];
}

+ (void)ori_activateConstraints:(NSArray *)constraints {
  BOOL hasActivateConstraints = [NSLayoutConstraint respondsToSelector:@selector(activateConstraints:)];
  if (hasActivateConstraints) {
    [self activateConstraints:constraints];
  } else {
    for (NSLayoutConstraint* constraint in constraints) {
      UIView* viewA = constraint.firstItem;
      UIView* viewB = constraint.secondItem;
      UIView* targetView = [self commonAncestorOf:viewA and:viewB];
      NSAssert(targetView, @"If this is nil the constraints are invalid for these target views.");
      [targetView addConstraints:@[constraint]];
    }
  }
}

+ (UIView*)commonAncestorOf:(UIView* __nonnull)viewA and:(UIView*)viewB {
  if (!viewB) {
    return viewA;
  }
  
  if (viewA.superview == viewB.superview) {
    return viewA.superview;
  }
  
  if (viewA.superview) {
    UIView* result = [self commonAncestorOf:viewA.superview and:viewB];
    if (result) {
      return result;
    }
  }
  
  return [self commonAncestorOf:viewA and:viewB.superview];
}

@end