//
//  UIViewController+OriginateKeyboardHelpers.h
//  TDP
//
//  Created by Sophie Shen on 04/25/16.
//  Copyright (c) 2016 Originate. All rights reserved.
//

@import UIKit;

@interface UIViewController (OriginateKeyboardHelpers)

- (void)setupDismissKeyboardOnTap;
- (void)dismissKeyboard;
- (void)adjustLayoutWithActiveView:(UIView*)activeView keyboardHeight:(CGFloat)keyboardHeight animationDuration:(NSTimeInterval)duration defaultViewFrame:(CGRect)viewFrame;
- (void)resetLayoutWithDefaultViewFrame:(CGRect)viewFrame animationDuration:(NSTimeInterval)duration;

- (CGFloat)defaultKeyboardHeightFromNotification:(NSNotification*)notification;
- (CGFloat)defaultKeyboardAnimationDurationFromNotification:(NSNotification*)notification;

@end
