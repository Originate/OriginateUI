//
//  OriginateValidatedTextField.m
//  OriginateUI
//
//  Created by Allen Wu on 8/13/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "OriginateValidatedTextField.h"

@interface OriginateValidatedTextField () <UITextFieldDelegate>

@property (nonatomic, assign, readwrite) BOOL valid;
@property (nonatomic, assign) BOOL dirty;
@property (nonatomic, weak) id<UITextFieldDelegate> externalDelegate;

@end

@implementation OriginateValidatedTextField

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];


    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (void)commonInit
{
    _validationMode = OriginateTextFieldValidationModeLive;
    
    self.delegate = self;
    [self addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
}


#pragma mark - Properties

- (void)setDelegate:(id<UITextFieldDelegate>)delegate
{
    if (self != delegate) {
        _externalDelegate = delegate;
    }

    [super setDelegate:self];
}

- (void)setValid:(BOOL)valid
{
    if (valid != _valid || !self.dirty) {
        self.dirty = YES;
        
        if (self.validationChangedBlock) {
            self.validationChangedBlock(valid, self);
        }
    }
    
    _valid = valid;
}


#pragma mark -

- (void)textFieldChanged:(UITextField *)sender
{
    if (self.validationMode == OriginateTextFieldValidationModeLive) {
        if (self.validationBlock) {
            self.valid = self.validationBlock(sender.text);
        }
    }
}


#pragma mark - <UITextFieldDelegate>

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if ([self.externalDelegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
        return [self.externalDelegate textFieldShouldBeginEditing:textField];
    }
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ([self.externalDelegate respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
        [self.externalDelegate textFieldDidBeginEditing:textField];
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if ([self.externalDelegate respondsToSelector:@selector(textFieldShouldEndEditing:)]) {
        return [self.externalDelegate textFieldShouldEndEditing:textField];
    }
    
    return YES;
}

- (BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string
{
    if ([self.externalDelegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        return [self.externalDelegate textField:textField
                  shouldChangeCharactersInRange:range
                              replacementString:string];
    }
    
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    if ([self.externalDelegate respondsToSelector:@selector(textFieldShouldClear:)]) {
        return [self.externalDelegate textFieldShouldClear:textField];
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([self.externalDelegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        return [self.externalDelegate textFieldShouldReturn:textField];
    }
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (self.validationMode == OriginateTextFieldValidationModeOnBlur) {
        if (self.validationBlock) {
            self.valid = self.validationBlock(textField.text);
        }
    }
    
    if ([self.externalDelegate respondsToSelector:@selector(textFieldDidEndEditing:)]) {
        [self.externalDelegate textFieldDidEndEditing:textField];
    }
}

@end
