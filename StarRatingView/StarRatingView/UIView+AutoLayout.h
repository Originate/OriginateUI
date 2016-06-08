//
//  UIView+AutoLayout.h
//  AutoLayout Extensions
//
//  Created by Aaron Daub on 2015-08-13.
//  Copyright (c) 2015 Aaron Daub. All rights reserved.
//  Licensed under MIT.

#import <UIKit/UIKit.h>

@interface UIView (AutoLayout)

#pragma mark - Centering

- (NSLayoutConstraint*)centerHorizontally;
- (NSLayoutConstraint*)centerVertically;
- (NSLayoutConstraint*)centerHorizontallyWithView:(UIView*)view;
- (NSLayoutConstraint*)centerVerticallyWithView:(UIView*)view;

#pragma mark - Pinning

- (NSLayoutConstraint*)pinToTop;
- (NSLayoutConstraint*)pinToBottom;
- (NSLayoutConstraint*)pinToLeft;
- (NSLayoutConstraint*)pinToRight;
- (NSLayoutConstraint*)pinToLeading;
- (NSLayoutConstraint*)pinToTrailing;

- (NSLayoutConstraint*)pinToTopWithPadding:(CGFloat)padding;
- (NSLayoutConstraint*)pinToBottomWithPadding:(CGFloat)padding;
- (NSLayoutConstraint*)pinToLeftWithPadding:(CGFloat)padding;
- (NSLayoutConstraint*)pinToRightWithPadding:(CGFloat)padding;
- (NSLayoutConstraint*)pinToLeadingWithPadding:(CGFloat)padding;
- (NSLayoutConstraint*)pinToTrailingWithPadding:(CGFloat)padding;

- (NSArray*)pinToHorizontalEdges;
- (NSArray*)pinToVerticalEdges;

- (NSArray*)pinToVerticalEdgesWithPadding:(CGFloat)padding;
- (NSArray*)pinToHorizontalEdgesWithPadding:(CGFloat)padding;

#pragma mark - Corners

- (NSArray*)placeInTopLeftCornerOfView:(UIView*)view;
- (NSArray*)placeInTopRightCornerOfView:(UIView*)view;
- (NSArray*)placeInBottomLeftCornerOfView:(UIView*)view;
- (NSArray*)placeInBottomRightCornerOfView:(UIView*)view;

- (NSArray*)placeInTopLeftCornerOfView:(UIView*)view
                               padding:(CGSize)padding;
- (NSArray*)placeInTopRightCornerOfView:(UIView*)view
                                padding:(CGSize)padding;
- (NSArray*)placeInBottomLeftCornerOfView:(UIView*)view
                                  padding:(CGSize)padding;
- (NSArray*)placeInBottomRightCornerOfView:(UIView*)view
                                   padding:(CGSize)padding;

#pragma mark - Adjacent to

- (NSLayoutConstraint*)placeBelowView:(UIView*)view;
- (NSLayoutConstraint*)placeAboveView:(UIView*)view;
- (NSLayoutConstraint*)placeLeftOfView:(UIView*)view;
- (NSLayoutConstraint*)placeRightOfView:(UIView*)view;
- (NSLayoutConstraint*)placeBelowView:(UIView*)view
                   padding:(CGFloat)padding;
- (NSLayoutConstraint*)placeAboveView:(UIView*)view
                   padding:(CGFloat)padding;
- (NSLayoutConstraint*)placeLeftOfView:(UIView*)view
                    padding:(CGFloat)padding;
- (NSLayoutConstraint*)placeRightOfView:(UIView*)view
                     padding:(CGFloat)padding;

#pragma mark - Alignment

- (NSLayoutConstraint*)alignLeftTo:(UIView*)view;
- (NSLayoutConstraint*)alignRightTo:(UIView*)view;
- (NSLayoutConstraint*)alignLeadingTo:(UIView*)view;
- (NSLayoutConstraint*)alignTrailingTo:(UIView*)view;
- (NSLayoutConstraint*)alignTopTo:(UIView*)view;
- (NSLayoutConstraint*)alignBottomTo:(UIView*)view;

- (NSLayoutConstraint*)alignLeftTo:(UIView*)view padding:(CGFloat)padding;
- (NSLayoutConstraint*)alignRightTo:(UIView*)view padding:(CGFloat)padding;
- (NSLayoutConstraint*)alignLeadingTo:(UIView*)view padding:(CGFloat)padding;
- (NSLayoutConstraint*)alignTrailingTo:(UIView*)view padding:(CGFloat)padding;
- (NSLayoutConstraint*)alignTopTo:(UIView*)view padding:(CGFloat)padding;
- (NSLayoutConstraint*)alignBottomTo:(UIView*)view padding:(CGFloat)padding;

#pragma mark - Sizing

- (NSLayoutConstraint*)fillWidth;
- (NSLayoutConstraint*)fillHeight;
- (NSLayoutConstraint*)fixWidth:(CGFloat)width;
- (NSLayoutConstraint*)fixHeight:(CGFloat)height;
- (NSArray*)fixSize:(CGSize)size;
- (NSLayoutConstraint*)matchWidthWithView:(UIView*)view;
- (NSLayoutConstraint*)matchHeightWithView:(UIView*)view;
- (NSLayoutConstraint*)matchWidthWithView:(UIView*)view multiplier:(CGFloat)multiplier;
- (NSLayoutConstraint*)matchHeightWithView:(UIView*)view multiplier:(CGFloat)multiplier;

#pragma mark - Linear Layouts

- (NSArray*)verticallyListViews:(NSArray*)views
                        padding:(CGFloat)padding;
- (NSArray*)horizontallyListViews:(NSArray*)views
                          padding:(CGFloat)padding;

#pragma mark - Aspect Ratio

- (NSLayoutConstraint*)maintainAspectRatio:(CGFloat)aspectRatio;

#pragma mark - Methods to Trampoline to

#pragma mark - Centering

- (NSLayoutConstraint*)centerHorizontallyAutomatically:(BOOL)automatically;
- (NSLayoutConstraint*)centerVerticallyAutomatically:(BOOL)automatically;
- (NSLayoutConstraint*)centerHorizontallyWithView:(UIView*)view automatically:(BOOL)automatically;
- (NSLayoutConstraint*)centerVerticallyWithView:(UIView*)view automatically:(BOOL)automatically;

#pragma mark - Pinning

- (NSLayoutConstraint*)pinToTopAutomatically:(BOOL)automatically;
- (NSLayoutConstraint*)pinToBottomAutomatically:(BOOL)automatically;
- (NSLayoutConstraint*)pinToLeftAutomatically:(BOOL)automatically;
- (NSLayoutConstraint*)pinToRightAutomatically:(BOOL)automatically;
- (NSLayoutConstraint*)pinToLeadingAutomatically:(BOOL)automatically;
- (NSLayoutConstraint*)pinToTrailingAutomatically:(BOOL)automatically;
- (NSLayoutConstraint*)pinToTopWithPadding:(CGFloat)padding automatically:(BOOL)automatically;
- (NSLayoutConstraint*)pinToBottomWithPadding:(CGFloat)padding automatically:(BOOL)automatically;
- (NSLayoutConstraint*)pinToLeftWithPadding:(CGFloat)padding automatically:(BOOL)automatically;
- (NSLayoutConstraint*)pinToRightWithPadding:(CGFloat)padding automatically:(BOOL)automatically;
- (NSLayoutConstraint*)pinToLeadingWithPadding:(CGFloat)padding automatically:(BOOL)automatically;
- (NSLayoutConstraint*)pinToTrailingWithPadding:(CGFloat)padding automatically:(BOOL)automatically;

- (NSArray*)pinToHorizontalEdgesAutomatically:(BOOL)automatically;
- (NSArray*)pinToHorizontalEdgesWithPadding:(CGFloat)padding automatically:(BOOL)automatically;

- (NSArray*)pinToVerticalEdgesAutomatically:(BOOL)automatically;
- (NSArray*)pinToVerticalEdgesWithPadding:(CGFloat)padding automatically:(BOOL)automatically;

#pragma mark - Corners

- (NSArray*)placeInTopLeftCornerOfView:(UIView*)view automatically:(BOOL)automatically;
- (NSArray*)placeInTopRightCornerOfView:(UIView*)view automatically:(BOOL)automatically;
- (NSArray*)placeInBottomLeftCornerOfView:(UIView*)view automatically:(BOOL)automatically;
- (NSArray*)placeInBottomRightCornerOfView:(UIView*)view automatically:(BOOL)automatically;
- (NSArray*)placeInTopLeftCornerOfView:(UIView*)view
                               padding:(CGSize)padding automatically:(BOOL)automatically;
- (NSArray*)placeInTopRightCornerOfView:(UIView*)view
                                padding:(CGSize)padding automatically:(BOOL)automatically;
- (NSArray*)placeInBottomLeftCornerOfView:(UIView*)view
                                  padding:(CGSize)padding automatically:(BOOL)automatically;
- (NSArray*)placeInBottomRightCornerOfView:(UIView*)view
                                   padding:(CGSize)padding automatically:(BOOL)automatically;

#pragma mark - Adjacent to

- (NSLayoutConstraint*)placeBelowView:(UIView*)view automatically:(BOOL)automatically;
- (NSLayoutConstraint*)placeAboveView:(UIView*)view automatically:(BOOL)automatically;
- (NSLayoutConstraint*)placeLeftOfView:(UIView*)view automatically:(BOOL)automatically;
- (NSLayoutConstraint*)placeRightOfView:(UIView*)view automatically:(BOOL)automatically;
- (NSLayoutConstraint*)placeBelowView:(UIView*)view
                   padding:(CGFloat)padding automatically:(BOOL)automatically;
- (NSLayoutConstraint*)placeAboveView:(UIView*)view
                   padding:(CGFloat)padding automatically:(BOOL)automatically;
- (NSLayoutConstraint*)placeLeftOfView:(UIView*)view
                    padding:(CGFloat)padding automatically:(BOOL)automatically;
- (NSLayoutConstraint*)placeRightOfView:(UIView*)view
                     padding:(CGFloat)padding automatically:(BOOL)automatically;

#pragma mark - Alignment

- (NSLayoutConstraint*)alignLeftTo:(UIView*)view
                     automatically:(BOOL)automatically;
- (NSLayoutConstraint*)alignRightTo:(UIView*)view
                      automatically:(BOOL)automatically;
- (NSLayoutConstraint*)alignLeadingTo:(UIView*)view
                        automatically:(BOOL)automatically;
- (NSLayoutConstraint*)alignTrailingTo:(UIView*)view
                         automatically:(BOOL)automatically;
- (NSLayoutConstraint*)alignTopTo:(UIView*)view
                    automatically:(BOOL)automatically;
- (NSLayoutConstraint*)alignBottomTo:(UIView*)view
                       automatically:(BOOL)automatically;

- (NSLayoutConstraint*)alignLeftTo:(UIView*)view
                           padding:(CGFloat)padding
                     automatically:(BOOL)automatically;
- (NSLayoutConstraint*)alignRightTo:(UIView*)view
                            padding:(CGFloat)padding
                      automatically:(BOOL)automatically;
- (NSLayoutConstraint*)alignLeadingTo:(UIView*)view
                              padding:(CGFloat)padding
                        automatically:(BOOL)automatically;
- (NSLayoutConstraint*)alignTrailingTo:(UIView*)view
                               padding:(CGFloat)padding
                         automatically:(BOOL)automatically;
- (NSLayoutConstraint*)alignTopTo:(UIView*)view
                          padding:(CGFloat)padding
                    automatically:(BOOL)automatically;
- (NSLayoutConstraint*)alignBottomTo:(UIView*)view
                             padding:(CGFloat)padding
                       automatically:(BOOL)automatically;

#pragma mark - Sizing

- (NSLayoutConstraint*)fillWidthAutomatically:(BOOL)automatically;
- (NSLayoutConstraint*)fillHeightAutomatically:(BOOL)automatically;
- (NSLayoutConstraint*)fixWidth:(CGFloat)width automatically:(BOOL)automatically;
- (NSLayoutConstraint*)fixHeight:(CGFloat)height automatically:(BOOL)automatically;
- (NSArray*)fixSize:(CGSize)size automatically:(BOOL)automatically;
- (NSLayoutConstraint*)matchWidthWithView:(UIView*)view automatically:(BOOL)automatically;
- (NSLayoutConstraint*)matchHeightWithView:(UIView*)view automatically:(BOOL)automatically;
- (NSLayoutConstraint*)matchWidthWithView:(UIView*)view multiplier:(CGFloat)multiplier automatically:(BOOL)automatically;
- (NSLayoutConstraint*)matchHeightWithView:(UIView*)view multiplier:(CGFloat)multiplier automatically:(BOOL)automatically;

#pragma mark - Linear Layouts

- (NSArray*)verticallyListViews:(NSArray*)views
                        padding:(CGFloat)padding automatically:(BOOL)automatically;
- (NSArray*)horizontallyListViews:(NSArray*)views
                          padding:(CGFloat)padding automatically:(BOOL)automatically;

#pragma mark - Aspect Ratio

- (NSLayoutConstraint*)maintainAspectRatio:(CGFloat)aspectRatio automatically:(BOOL)automatically;

@end
