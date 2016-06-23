//
//  OriginateValidatedTextField.h
//  OriginateUI
//
//  Created by Allen Wu on 8/13/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "OriginateTextField.h"

@class OriginateValidatedTextField;

NS_ASSUME_NONNULL_BEGIN

typedef BOOL (^OriginateTextFieldValidationBlock)(NSString* text);
typedef void (^OriginateTextFieldValidationChangedBlock)(BOOL valid, OriginateValidatedTextField* textField);

typedef NS_ENUM(NSUInteger, OriginateTextFieldValidationMode) {
    OriginateTextFieldValidationModeLive = 0,
    OriginateTextFieldValidationModeOnBlur,
};


/**
 *  A subclass of UITextField that adds validation capabilities.
 */
@interface OriginateValidatedTextField : OriginateTextField

@property (nonatomic, assign) OriginateTextFieldValidationMode validationMode;
@property (nonatomic, copy) OriginateTextFieldValidationBlock validationBlock;
@property (nonatomic, copy, nullable) OriginateTextFieldValidationChangedBlock validationChangedBlock;
@property (nonatomic, assign, readonly, getter=isValid) BOOL valid;

@end

NS_ASSUME_NONNULL_END
