//
//  UIView+AutoLayout.m
//  AutoLayout Extensions
//
//  Created by Aaron Daub on 2015-08-13.
//  Copyright (c) 2015 Aaron Daub. All rights reserved.
//  Licensed under MIT.

#import "UIView+AutoLayout.h"
#import "NSLayoutConstraint+AutoLayout.h"

@implementation UIView (AutoLayout)

#pragma mark - Centering

- (NSLayoutConstraint*)centerHorizontally {
  return [self centerHorizontallyWithView:self.superview];
}

- (NSLayoutConstraint*)centerVertically {
  return [self centerVerticallyWithView:self.superview];
}

- (NSLayoutConstraint*)centerHorizontallyWithView:(UIView*)view {
  return [self centerHorizontallyWithView:view automatically:YES];
}

- (NSLayoutConstraint*)centerVerticallyWithView:(UIView*)view {
  return [self centerVerticallyWithView:view automatically:YES];
}

#pragma mark - Pinning

- (NSLayoutConstraint*)pinToTop {
  return [self pinToTopWithPadding:0];
}

- (NSLayoutConstraint*)pinToBottom {
  return [self pinToBottomWithPadding:0];
}

- (NSLayoutConstraint*)pinToLeft {
  return [self pinToLeftWithPadding:0];
}

- (NSLayoutConstraint*)pinToRight {
  return [self pinToRightWithPadding:0];
}

- (NSLayoutConstraint*)pinToLeading {
  return [self pinToLeadingWithPadding:0];
}

- (NSLayoutConstraint*)pinToTrailing {
  return [self pinToTrailingWithPadding:0];
}

- (NSLayoutConstraint*)pinToTopWithPadding:(CGFloat)padding {
  return [self pinToTopWithPadding:padding automatically:YES];
}

- (NSLayoutConstraint*)pinToBottomWithPadding:(CGFloat)padding {
  return [self pinToBottomWithPadding:padding automatically:YES];
}

- (NSLayoutConstraint*)pinToLeftWithPadding:(CGFloat)padding {
  return [self pinToLeftWithPadding:padding automatically:YES];
}

- (NSLayoutConstraint*)pinToRightWithPadding:(CGFloat)padding {
  return [self pinToRightWithPadding:padding automatically:YES];
}

- (NSLayoutConstraint*)pinToLeadingWithPadding:(CGFloat)padding {
  return [self pinToLeadingWithPadding:padding automatically:YES];
}

- (NSLayoutConstraint*)pinToTrailingWithPadding:(CGFloat)padding {
  return [self pinToTrailingWithPadding:padding automatically:YES];
}

- (NSArray*)pinToHorizontalEdges {
  return [self pinToHorizontalEdgesWithPadding:0];
}

- (NSArray*)pinToHorizontalEdgesWithPadding:(CGFloat)padding {
  return [self pinToHorizontalEdgesWithPadding:padding automatically:YES];
}

- (NSArray*)pinToVerticalEdges {
  return [self pinToVerticalEdgesWithPadding:0];
}

- (NSArray*)pinToVerticalEdgesWithPadding:(CGFloat)padding {
  return [self pinToVerticalEdgesWithPadding:padding automatically:YES];
}

#pragma mark - Corners

- (NSArray*)placeInTopLeftCornerOfView:(UIView*)view {
  return [self placeInTopLeftCornerOfView:view padding:CGSizeZero];
}

- (NSArray*)placeInTopRightCornerOfView:(UIView*)view {
  return [self placeInTopRightCornerOfView:view padding:CGSizeZero];
}

- (NSArray*)placeInBottomLeftCornerOfView:(UIView*)view {
  return [self placeInBottomLeftCornerOfView:view padding:CGSizeZero];
}

- (NSArray*)placeInBottomRightCornerOfView:(UIView*)view {
  return [self placeInBottomLeftCornerOfView:view padding:CGSizeZero];
}

- (NSArray*)placeInTopLeftCornerOfView:(UIView*)view
                               padding:(CGSize)padding {
  return [self placeInTopLeftCornerOfView:view padding:padding automatically:YES];
}

- (NSArray*)placeInTopRightCornerOfView:(UIView*)view
                                padding:(CGSize)padding {
  return [self placeInTopRightCornerOfView:view padding:padding automatically:YES];
}

- (NSArray*)placeInBottomLeftCornerOfView:(UIView*)view
                                  padding:(CGSize)padding {
  return [self placeInBottomLeftCornerOfView:view padding:padding automatically:YES];
}

- (NSArray*)placeInBottomRightCornerOfView:(UIView*)view
                                   padding:(CGSize)padding {
  return [self placeInBottomRightCornerOfView:view padding:padding automatically:YES];
}

#pragma mark - Adjacent to

- (NSLayoutConstraint*)placeBelowView:(UIView*)view {
  return [self placeBelowView:view padding:0];
}

- (NSLayoutConstraint*)placeAboveView:(UIView*)view {
  return [self placeAboveView:view padding:0];
}
- (NSLayoutConstraint*)placeLeftOfView:(UIView*)view {
  return [self placeLeftOfView:view padding:0];
}
- (NSLayoutConstraint*)placeRightOfView:(UIView*)view {
  return [self placeRightOfView:view padding:0];
}

- (NSLayoutConstraint*)placeBelowView:(UIView*)view
                   padding:(CGFloat)padding {
  return [self placeBelowView:view padding:padding automatically:YES];
}

- (NSLayoutConstraint*)placeAboveView:(UIView*)view
                   padding:(CGFloat)padding {
  return [self placeAboveView:view padding:padding automatically:YES];
}

- (NSLayoutConstraint*)placeLeftOfView:(UIView*)view
                    padding:(CGFloat)padding {
  return [self placeLeftOfView:view padding:padding automatically:YES];
}

- (NSLayoutConstraint*)placeRightOfView:(UIView*)view
                     padding:(CGFloat)padding {
  return [self placeRightOfView:view padding:padding automatically:YES];
}

#pragma mark - Sizing

- (NSLayoutConstraint*)fillWidth {
  return [self fillWidthAutomatically:YES];
}
- (NSLayoutConstraint*)fillHeight {
  return [self fillHeightAutomatically:YES];
}

- (NSLayoutConstraint*)fixWidth:(CGFloat)width {
  return [self fixWidth:width automatically:YES];
}

- (NSLayoutConstraint*)fixHeight:(CGFloat)height {
  return [self fixHeight:height automatically:YES];
}

- (NSArray*)fixSize:(CGSize)size {
  return [self fixSize:size automatically:YES];
}

- (NSLayoutConstraint*)matchWidthWithView:(UIView*)view {
  return [self matchWidthWithView:view automatically:YES];
}

- (NSLayoutConstraint*)matchHeightWithView:(UIView*)view {
  return [self matchHeightWithView:view automatically:YES];
}

- (NSLayoutConstraint*)matchWidthWithView:(UIView*)view multiplier:(CGFloat)multiplier {
  return [self matchWidthWithView:view multiplier:multiplier automatically:YES];
}

- (NSLayoutConstraint*)matchHeightWithView:(UIView*)view multiplier:(CGFloat)multiplier {
  return [self matchHeightWithView:view multiplier:multiplier automatically:YES];
}

#pragma mark - Alignment

- (NSLayoutConstraint*)alignLeftTo:(UIView*)view {
  return [self alignLeftTo:view padding:0];
}

- (NSLayoutConstraint*)alignRightTo:(UIView*)view {
  return [self alignRightTo:view padding:0];
}

- (NSLayoutConstraint*)alignLeadingTo:(UIView*)view {
  return [self alignLeadingTo:view padding:0];
}

- (NSLayoutConstraint*)alignTrailingTo:(UIView*)view {
  return [self alignTrailingTo:view padding:0];
}

- (NSLayoutConstraint*)alignTopTo:(UIView*)view {
  return [self alignTopTo:view padding:0];
}

- (NSLayoutConstraint*)alignBottomTo:(UIView*)view {
  return [self alignBottomTo:view padding:0];
}

- (NSLayoutConstraint*)alignLeftTo:(UIView*)view padding:(CGFloat)padding {
  return [self alignLeftTo:view padding:padding automatically:YES];
}

- (NSLayoutConstraint*)alignRightTo:(UIView*)view padding:(CGFloat)padding {
  return [self alignRightTo:view padding:padding automatically:YES];
}

- (NSLayoutConstraint*)alignLeadingTo:(UIView*)view padding:(CGFloat)padding {
  return [self alignLeadingTo:view padding:padding automatically:YES];
}

- (NSLayoutConstraint*)alignTrailingTo:(UIView*)view padding:(CGFloat)padding {
  return [self alignTrailingTo:view padding:padding automatically:YES];
}

- (NSLayoutConstraint*)alignTopTo:(UIView*)view padding:(CGFloat)padding {
  return [self alignTopTo:view padding:padding automatically:YES];
}

- (NSLayoutConstraint*)alignBottomTo:(UIView*)view padding:(CGFloat)padding {
  return [self alignBottomTo:view padding:padding automatically:YES];
}


#pragma mark - Linear Layouts

- (NSArray*)verticallyListViews:(NSArray*)views
                        padding:(CGFloat)padding {
  return [self verticallyListViews:views padding:padding automatically:YES];
}

- (NSArray*)horizontallyListViews:(NSArray*)views
                          padding:(CGFloat)padding {
  return [self horizontallyListViews:views padding:padding automatically:YES];
}

#pragma mark - Aspect Ratio

- (NSLayoutConstraint*)maintainAspectRatio:(CGFloat)aspectRatio {
  return [self maintainAspectRatio:aspectRatio automatically:YES];
}

#pragma mark - Methods to Trampoline to

#pragma mark - Centering

- (NSLayoutConstraint*)centerHorizontallyAutomatically:(BOOL)automatically {
  return [self centerHorizontallyWithView:self.superview automatically:automatically];
}
- (NSLayoutConstraint*)centerVerticallyAutomatically:(BOOL)automatically{
  return [self centerVerticallyWithView:self.superview automatically:automatically];
}

- (NSLayoutConstraint*)centerHorizontallyWithView:(UIView*)view automatically:(BOOL)automatically {
  NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX toItem:view];
  
  if (automatically) {
    [NSLayoutConstraint ori_activateConstraints:@[constraint]];
  }
  
  return constraint;
}
- (NSLayoutConstraint*)centerVerticallyWithView:(UIView*)view automatically:(BOOL)automatically {
  NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY toItem:view];
  
  if (automatically) {
    [NSLayoutConstraint ori_activateConstraints:@[constraint]];
  }
  
  return constraint;
}

#pragma mark - Pinning

- (NSLayoutConstraint*)pinToTopAutomatically:(BOOL)automatically {
  return [self pinToTopWithPadding:0 automatically:automatically];
}

- (NSLayoutConstraint*)pinToBottomAutomatically:(BOOL)automatically {
  return [self pinToBottomWithPadding:0 automatically:automatically];
}

- (NSLayoutConstraint*)pinToLeftAutomatically:(BOOL)automatically {
  return [self pinToLeftWithPadding:0 automatically:automatically];
}

- (NSLayoutConstraint*)pinToRightAutomatically:(BOOL)automatically {
  return [self pinToRightWithPadding:0 automatically:automatically];
}

- (NSLayoutConstraint*)pinToLeadingAutomatically:(BOOL)automatically {
  return [self pinToLeadingWithPadding:0 automatically:automatically];
}

- (NSLayoutConstraint*)pinToTrailingAutomatically:(BOOL)automatically {
  return [self pinToTrailingWithPadding:0 automatically:automatically];
}

- (NSLayoutConstraint*)pinToTopWithPadding:(CGFloat)padding automatically:(BOOL)automatically {
  NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop toItem:self.superview];
  constraint.constant = padding;
  if (automatically) {
    [NSLayoutConstraint ori_activateConstraints:@[constraint]];
  }
  
  return constraint;
}

- (NSLayoutConstraint*)pinToBottomWithPadding:(CGFloat)padding automatically:(BOOL)automatically {
  NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom toItem:self.superview];
  constraint.constant = -padding;
  if (automatically) {
    [NSLayoutConstraint ori_activateConstraints:@[constraint]];
  }
  
  return constraint;
}

- (NSLayoutConstraint*)pinToLeftWithPadding:(CGFloat)padding automatically:(BOOL)automatically {
  NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft toItem:self.superview];
  constraint.constant = padding;
  if (automatically) {
    [NSLayoutConstraint ori_activateConstraints:@[constraint]];
  }
  
  return constraint;
}

- (NSLayoutConstraint*)pinToRightWithPadding:(CGFloat)padding automatically:(BOOL)automatically {
  NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight toItem:self.superview];
  constraint.constant = -padding;
  if (automatically) {
    [NSLayoutConstraint ori_activateConstraints:@[constraint]];
  }
  
  return constraint;
}

- (NSLayoutConstraint*)pinToLeadingWithPadding:(CGFloat)padding automatically:(BOOL)automatically {
  NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading toItem:self.superview];
  constraint.constant = padding;
  if (automatically) {
    [NSLayoutConstraint ori_activateConstraints:@[constraint]];
  }
  
  return constraint;
}

- (NSLayoutConstraint*)pinToTrailingWithPadding:(CGFloat)padding automatically:(BOOL)automatically {
  NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing toItem:self.superview];
  constraint.constant = -padding;
  if (automatically) {
    [NSLayoutConstraint ori_activateConstraints:@[constraint]];
  }
  
  return constraint;
}

- (NSArray*)pinToHorizontalEdgesAutomatically:(BOOL)automatically {
  return [self pinToHorizontalEdgesWithPadding:0 automatically:automatically];
}


- (NSArray*)pinToVerticalEdgesAutomatically:(BOOL)automatically {
  return [self pinToVerticalEdgesWithPadding:0 automatically:automatically];
}

- (NSArray*)pinToVerticalEdgesWithPadding:(CGFloat)padding automatically:(BOOL)automatically {
  return @[[self pinToTopWithPadding:padding automatically:automatically],
           [self pinToBottomWithPadding:-padding automatically:automatically]];
}

- (NSArray*)pinToHorizontalEdgesWithPadding:(CGFloat)padding automatically:(BOOL)automatically {
  return @[[self pinToLeftWithPadding:padding automatically:automatically],
           [self pinToRightWithPadding:-padding automatically:automatically]];
}

#pragma mark - Corners

- (NSArray*)placeInTopLeftCornerOfView:(UIView*)view automatically:(BOOL)automatically {
  return [self placeInBottomRightCornerOfView:view padding:CGSizeZero automatically:automatically];
}

- (NSArray*)placeInTopRightCornerOfView:(UIView*)view automatically:(BOOL)automatically {
  return [self placeInBottomRightCornerOfView:view padding:CGSizeZero automatically:automatically];
}

- (NSArray*)placeInBottomLeftCornerOfView:(UIView*)view automatically:(BOOL)automatically {
  return [self placeInBottomRightCornerOfView:view padding:CGSizeZero automatically:automatically];
}

- (NSArray*)placeInBottomRightCornerOfView:(UIView*)view automatically:(BOOL)automatically {
  return [self placeInBottomRightCornerOfView:view padding:CGSizeZero automatically:automatically];
}

- (NSArray*)placeInTopLeftCornerOfView:(UIView*)view
                               padding:(CGSize)padding
                     automatically:(BOOL)automatically {
  return @[[self alignTopTo:view padding:padding.height],
           [self alignLeftTo:view padding:padding.width]];
}

- (NSArray*)placeInTopRightCornerOfView:(UIView*)view
                                padding:(CGSize)padding
                      automatically:(BOOL)automatically {
  return @[[self alignTopTo:view padding:padding.height],
           [self alignRightTo:view padding:padding.width]];
}

- (NSArray*)placeInBottomLeftCornerOfView:(UIView*)view
                                  padding:(CGSize)padding
                        automatically:(BOOL)automatically {
  return @[[self alignBottomTo:view padding:padding.height],
           [self alignLeftTo:view padding:padding.width]];
}

- (NSArray*)placeInBottomRightCornerOfView:(UIView*)view
                                   padding:(CGSize)padding
                         automatically:(BOOL)automatically {
  return @[[self alignBottomTo:view padding:padding.height],
           [self alignRightTo:view padding:padding.width]];
}

#pragma mark - Adjacent to

- (NSLayoutConstraint*)placeBelowView:(UIView*)view automatically:(BOOL)automatically {
  return [self placeBelowView:view padding:0 automatically:automatically];
}

- (NSLayoutConstraint*)placeAboveView:(UIView*)view automatically:(BOOL)automatically {
  return [self placeAboveView:view padding:0 automatically:automatically];
}

- (NSLayoutConstraint*)placeLeftOfView:(UIView*)view automatically:(BOOL)automatically {
  return [self placeLeftOfView:view padding:0 automatically:automatically];
}

- (NSLayoutConstraint*)placeRightOfView:(UIView*)view automatically:(BOOL)automatically {
  return [self placeRightOfView:view padding:0 automatically:automatically];
}

- (NSLayoutConstraint*)placeBelowView:(UIView*)view
                   padding:(CGFloat)padding automatically:(BOOL)automatically {
  NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:view
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:padding];
  
  if (automatically) {
    [NSLayoutConstraint ori_activateConstraints:@[constraint]];
  }
  
  return constraint;
}

- (NSLayoutConstraint*)placeAboveView:(UIView*)view
                   padding:(CGFloat)padding automatically:(BOOL)automatically {
  NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self
                                                                attribute:NSLayoutAttributeBottom
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:view
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1
                                                                 constant:-padding];
  
  if (automatically) {
    [NSLayoutConstraint ori_activateConstraints:@[constraint]];
  }
  
  return constraint;
}

- (NSLayoutConstraint*)placeLeftOfView:(UIView*)view
                    padding:(CGFloat)padding automatically:(BOOL)automatically {
  NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self
                                                                attribute:NSLayoutAttributeRight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:view
                                                                attribute:NSLayoutAttributeLeft
                                                               multiplier:1
                                                                 constant:-padding];
  
  if (automatically) {
    [NSLayoutConstraint ori_activateConstraints:@[constraint]];
  }
  
  return constraint;
}

- (NSLayoutConstraint*)placeRightOfView:(UIView*)view
                     padding:(CGFloat)padding automatically:(BOOL)automatically {
  NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self
                                                                attribute:NSLayoutAttributeLeft
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:view
                                                                attribute:NSLayoutAttributeRight
                                                               multiplier:1
                                                                 constant:padding];
  
  if (automatically) {
    [NSLayoutConstraint ori_activateConstraints:@[constraint]];
  }
  
  return constraint;
}

#pragma mark - Alignment

- (NSLayoutConstraint*)alignLeftTo:(UIView*)view
                     automatically:(BOOL)automatically {
  return [self alignLeftTo:view padding:0 automatically:automatically];
}

- (NSLayoutConstraint*)alignRightTo:(UIView*)view
                      automatically:(BOOL)automatically {
  return [self alignRightTo:view padding:0 automatically:automatically];
}

- (NSLayoutConstraint*)alignLeadingTo:(UIView*)view
                        automatically:(BOOL)automatically {
  return [self alignLeadingTo:view padding:0 automatically:automatically];
}

- (NSLayoutConstraint*)alignTrailingTo:(UIView*)view
                         automatically:(BOOL)automatically {
  return [self alignTrailingTo:view padding:0 automatically:automatically];
}

- (NSLayoutConstraint*)alignTopTo:(UIView*)view
                    automatically:(BOOL)automatically {
  return [self alignTopTo:view padding:0 automatically:automatically];
}

- (NSLayoutConstraint*)alignBottomTo:(UIView*)view
                       automatically:(BOOL)automatically {
  return [self alignBottomTo:view padding:0 automatically:automatically];
}

- (NSLayoutConstraint*)alignLeftTo:(UIView*)view
                           padding:(CGFloat)padding
                     automatically:(BOOL)automatically {
  NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeft multiplier:1 constant:padding];
  if (automatically) {
    [NSLayoutConstraint ori_activateConstraints:@[constraint]];
  }
  return constraint;
}

- (NSLayoutConstraint*)alignRightTo:(UIView*)view
                            padding:(CGFloat)padding
                      automatically:(BOOL)automatically {
  NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeRight multiplier:1 constant:-padding];
  if (automatically) {
    [NSLayoutConstraint ori_activateConstraints:@[constraint]];
  }
  return constraint;
}

- (NSLayoutConstraint*)alignLeadingTo:(UIView*)view
                              padding:(CGFloat)padding
                        automatically:(BOOL)automatically {
  NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeading multiplier:1 constant:padding];
  if (automatically) {
    [NSLayoutConstraint ori_activateConstraints:@[constraint]];
  }
  return constraint;
}

- (NSLayoutConstraint*)alignTrailingTo:(UIView*)view
                               padding:(CGFloat)padding
                         automatically:(BOOL)automatically {
  NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTrailing multiplier:1 constant:-padding];
  if (automatically) {
    [NSLayoutConstraint ori_activateConstraints:@[constraint]];
  }
  return constraint;
}

- (NSLayoutConstraint*)alignTopTo:(UIView*)view
                          padding:(CGFloat)padding
                    automatically:(BOOL)automatically {
  NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1 constant:padding];
  if (automatically) {
    [NSLayoutConstraint ori_activateConstraints:@[constraint]];
  }
  return constraint;
}

- (NSLayoutConstraint*)alignBottomTo:(UIView*)view
                             padding:(CGFloat)padding
                       automatically:(BOOL)automatically {
  NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1 constant:-padding];
  if (automatically) {
    [NSLayoutConstraint ori_activateConstraints:@[constraint]];
  }
  return constraint;
}


#pragma mark - Sizing

- (NSLayoutConstraint*)fillWidthAutomatically:(BOOL)automatically {
  return [self matchWidthWithView:self.superview automatically:automatically];
}

- (NSLayoutConstraint*)fillHeightAutomatically:(BOOL)automatically {
  return [self matchHeightWithView:self.superview automatically:automatically];
}

- (NSLayoutConstraint*)fixWidth:(CGFloat)width automatically:(BOOL)automatically {
  NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1
                                                                 constant:width];
  
  if (automatically) {
    [NSLayoutConstraint ori_activateConstraints:@[constraint]];
  }
  
  return constraint;
}

- (NSLayoutConstraint*)fixHeight:(CGFloat)height automatically:(BOOL)automatically {
  NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1
                                                                 constant:height];
  
  if (automatically) {
    [NSLayoutConstraint ori_activateConstraints:@[constraint]];
  }
  
  return constraint;
}

- (NSArray*)fixSize:(CGSize)size automatically:(BOOL)automatically {
  return @[[self fixWidth:size.width automatically:automatically],
           [self fixHeight:size.height automatically:automatically]];
}

- (NSLayoutConstraint*)matchWidthWithView:(UIView*)view automatically:(BOOL)automatically {
  NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth toItem:view];
  
  if (automatically) {
    [NSLayoutConstraint ori_activateConstraints:@[constraint]];
  }
  
  return constraint;
}

- (NSLayoutConstraint*)matchHeightWithView:(UIView*)view automatically:(BOOL)automatically {
  NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight toItem:view];
  
  if (automatically) {
    [NSLayoutConstraint ori_activateConstraints:@[constraint]];
  }
  
  return constraint;
}

- (NSLayoutConstraint*)matchWidthWithView:(UIView *)view multiplier:(CGFloat)multiplier automatically:(BOOL)automatically {
  NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:view
                                                                attribute:NSLayoutAttributeWidth
                                                               multiplier:multiplier
                                                                 constant:0];
  
  if (automatically) {
    [NSLayoutConstraint ori_activateConstraints:@[constraint]];
  }
  
  return constraint;
}

- (NSLayoutConstraint*)matchHeightWithView:(UIView *)view multiplier:(CGFloat)multiplier automatically:(BOOL)automatically {
  NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:view
                                                                attribute:NSLayoutAttributeHeight
                                                               multiplier:multiplier
                                                                 constant:0];
  
  if (automatically) {
    [NSLayoutConstraint ori_activateConstraints:@[constraint]];
  }
  
  return constraint;
}

#pragma mark - Linear Layouts

- (NSArray*)verticallyListViews:(NSArray*)views
                        padding:(CGFloat)padding automatically:(BOOL)automatically {
  NSMutableArray* constraints = [NSMutableArray array];
  
  UIView* previousView;
  for (UIView* view in views) {
    if (previousView) {
      [constraints addObject:[view placeBelowView:previousView padding:padding automatically:automatically]];
    }
    previousView = view;
  }
  return [constraints copy];
}

- (NSArray*)horizontallyListViews:(NSArray*)views
                          padding:(CGFloat)padding automatically:(BOOL)automatically {
  NSMutableArray* constraints = [NSMutableArray array];
  
  UIView* previousView;
  for (UIView* view in views) {
    if (previousView) {
      [constraints addObject:[view placeRightOfView:previousView padding:padding automatically:automatically]];
    }
    previousView = view;
  }
  return [constraints copy];
}

#pragma mark - Aspect Ratio

- (NSLayoutConstraint*)maintainAspectRatio:(CGFloat)aspectRatio automatically:(BOOL)automatically {
  NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self
                                                                attribute:NSLayoutAttributeHeight
                                                               multiplier:aspectRatio
                                                                 constant:0];
  
  if (automatically) {
    [NSLayoutConstraint ori_activateConstraints:@[constraint]];
  }
  
  return constraint;
}

@end
