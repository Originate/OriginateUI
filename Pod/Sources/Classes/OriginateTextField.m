//
//  OriginateTextField.m
//  OriginateUI
//
//  Created by Philip Kluz on 7/7/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "OriginateTextField.h"

@implementation OriginateTextField

#pragma mark - UIView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        _textEdgeInsets = UIEdgeInsetsZero;
        _clearButtonEdgeInsets = UIEdgeInsetsZero;
        _leftViewInsets = UIEdgeInsetsZero;
        _rightViewInsets = UIEdgeInsetsZero;
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        _textEdgeInsets = UIEdgeInsetsZero;
        _clearButtonEdgeInsets = UIEdgeInsetsZero;
        _leftViewInsets = UIEdgeInsetsZero;
        _rightViewInsets = UIEdgeInsetsZero;
    }
    
    return self;
}

#pragma mark - UITextField

- (CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect baseRect = [super textRectForBounds:bounds];
    CGRect rect = UIEdgeInsetsInsetRect(baseRect, self.textEdgeInsets);
    return rect;
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect rect = [self textRectForBounds:bounds];
    return rect;
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
    CGRect rect = [self textRectForBounds:bounds];
    return rect;
}

- (CGRect)clearButtonRectForBounds:(CGRect)bounds
{
    CGRect rect = [super clearButtonRectForBounds:bounds];
    
    rect.origin.x = rect.origin.x + self.clearButtonEdgeInsets.right;
    rect.origin.y = rect.origin.y + self.clearButtonEdgeInsets.top;
    
    return rect;
}

- (CGRect)rightViewRectForBounds:(CGRect)bounds
{
    CGRect rect = [super rightViewRectForBounds:bounds];
    
    rect.origin.x = rect.origin.x + self.rightViewInsets.right;
    rect.origin.y = rect.origin.y + self.rightViewInsets.top;
    
    return rect;
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    CGRect rect = [super leftViewRectForBounds:bounds];
    
    rect.origin.x = rect.origin.x + self.leftViewInsets.left;
    rect.origin.y = rect.origin.y + self.leftViewInsets.top;
    
    return rect;
}

@end
