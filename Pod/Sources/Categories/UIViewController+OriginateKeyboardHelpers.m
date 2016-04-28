//
//  UIViewController+OriginateKeyboardHelpers.m
//  TDP
//
//  Created by Sophie Shen on 04/25/16.
//  Copyright (c) 2016 Originate. All rights reserved.
//

#import "UIViewController+OriginateKeyboardHelpers.h"

@implementation UIViewController (TDPKeyboardHelpers)

#pragma mark - Dismiss Keyboard On Tap

- (void)setupDismissKeyboardOnTap {
  UITapGestureRecognizer* tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
  [self.view addGestureRecognizer:tapGestureRecognizer];
}

- (void)dismissKeyboard {
  [self.view endEditing:YES];
}

- (void)adjustLayoutWithActiveView:(UIView*)activeView keyboardHeight:(CGFloat)keyboardHeight animationDuration:(NSTimeInterval)duration defaultViewFrame:(CGRect)viewFrame{
  if (!(activeView && keyboardHeight > 0 && duration > 0)) {
    return;
  }
  
  // top position of the keyboard
  CGFloat keyboardTop = CGRectGetHeight(self.view.frame) - keyboardHeight;
  
  // bottom position of the keyboard
  CGRect textFieldFrame = [self.view convertRect:activeView.frame fromView:activeView.superview] ;
  CGFloat originalTextFieldBottom = textFieldFrame.origin.y + textFieldFrame.size.height;
  CGFloat textFieldBottom = MIN(originalTextFieldBottom, viewFrame.size.height);
  
  // if the keyboard covers the selected text field, move the view up
  if (keyboardTop < textFieldBottom) {
    CGRect newFrame = viewFrame;
    float verticalOffset = textFieldBottom - keyboardTop;
    newFrame.origin.y -= verticalOffset;

    // animate the layout with the same animation rates of the keyboard when it appears
    [UIView animateWithDuration:duration animations:^{
      self.view.frame = newFrame;
      
      if (originalTextFieldBottom - viewFrame.size.height > 0 && ![activeView isKindOfClass:[UITextField class]]) {
        UIScrollView* scrollView = nil;
        UIView* view = activeView.superview;
        while (view != self.view) {
          if ([view isKindOfClass:[UIScrollView class]]) {
            scrollView = (UIScrollView*)view;
            break;
          }
          view = view.superview;
        }
        
        if (scrollView) {
          CGPoint contentOffset = scrollView.contentOffset;
          contentOffset.y += originalTextFieldBottom - viewFrame.size.height;
          scrollView.contentOffset = contentOffset;
        }
      }
    }];
  }
}

- (void)resetLayoutWithDefaultViewFrame:(CGRect)viewFrame animationDuration:(NSTimeInterval)duration {
  // animate the layout with the same animation rates of the keyboard when it disappears
  [UIView animateWithDuration:duration animations:^{
    self.view.frame = viewFrame;
  }];
}

#pragma mark - Class Method

- (CGFloat)defaultKeyboardHeightFromNotification:(NSNotification*)notification {
  return [self.view convertRect:[notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue] fromView:nil].size.height;
}

- (CGFloat)defaultKeyboardAnimationDurationFromNotification:(NSNotification*)notification {
  return [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
}

@end
