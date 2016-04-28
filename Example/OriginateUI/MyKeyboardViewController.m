//
//  MyKeyboardViewController.m
//  OriginateUI
//
//  Created by Shen on 4/25/16.
//  Copyright © 2016 originate.com. All rights reserved.
//

#import "MyKeyboardViewController.h"

@interface MyKeyboardViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic) CGRect defaultViewFrame;
@property (nonatomic) CGFloat keyboardHeight;
@property (nonatomic) NSTimeInterval keyboardAnimationDuration;
@property (nonatomic, weak) UIView* activeView;

@property (nonatomic, weak) IBOutlet UITextField* firstTextField;
@property (nonatomic, weak) IBOutlet UITextField* secondTextField;
@property (nonatomic, weak) IBOutlet UITextField* ThirdTextField;
@property (nonatomic, weak) IBOutlet UITextField* ForthTextField;
@property (nonatomic, weak) IBOutlet UITextField* FifthTextField;
@property (nonatomic, weak) IBOutlet UITextView* textView;

@end

@implementation MyKeyboardViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setupDismissKeyboardOnTap];
  [self registerKeyboardNotifications];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  self.defaultViewFrame = self.view.frame;
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  [self dismissKeyboard];
}

- (void)dealloc {
  [self unregisterKeyboardNotifications];
}

#pragma mark - Keyboard Notifications

- (void)registerKeyboardNotifications {
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardWillShow:)
                                               name:UIKeyboardWillShowNotification
                                             object:nil];
  
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardWillHide)
                                               name:UIKeyboardWillHideNotification
                                             object:nil];
}

- (void)unregisterKeyboardNotifications {
  [[NSNotificationCenter defaultCenter] removeObserver:self
                                                  name:UIKeyboardWillShowNotification
                                                object:nil];
  
  [[NSNotificationCenter defaultCenter] removeObserver:self
                                                  name:UIKeyboardWillHideNotification
                                                object:nil];
}

#pragma mark - Keyboard Listeners

- (void)keyboardWillShow:(NSNotification*)notification {
  self.keyboardHeight = [self defaultKeyboardHeightFromNotification:notification];
  self.keyboardAnimationDuration = [self defaultKeyboardAnimationDurationFromNotification:notification];
  
  [self adjustLayoutWithActiveView:self.activeView keyboardHeight:self.keyboardHeight animationDuration:self.keyboardAnimationDuration defaultViewFrame:self.defaultViewFrame];
}

- (void)keyboardWillHide {
  self.activeView = nil;
  [self resetLayoutWithDefaultViewFrame:self.defaultViewFrame animationDuration:self.keyboardAnimationDuration];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField*)textField {
  self.activeView = textField;
  [self adjustLayoutWithActiveView:self.activeView keyboardHeight:self.keyboardHeight animationDuration:self.keyboardAnimationDuration defaultViewFrame:self.defaultViewFrame];
}

- (BOOL)textFieldShouldReturn:(UITextField*)textField {
  if (textField == self.FifthTextField) {
    [self.ForthTextField becomeFirstResponder];
  } else if (textField == self.ForthTextField) {
    [self.ThirdTextField becomeFirstResponder];
  } else if (textField == self.ThirdTextField) {
    [self.secondTextField becomeFirstResponder];
  } else if (textField == self.secondTextField) {
    [self.textView becomeFirstResponder];
  } else {
    [textField resignFirstResponder];
  }
  return YES;
}

#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView*)textView {
  self.activeView = textView;
  [self adjustLayoutWithActiveView:self.activeView keyboardHeight:self.keyboardHeight animationDuration:self.keyboardAnimationDuration defaultViewFrame:self.defaultViewFrame];
}

@end
