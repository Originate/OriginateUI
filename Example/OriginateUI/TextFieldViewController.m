//
//  TextFieldViewController.m
//  OriginateUI
//
//  Created by Seth Rainha on 6/21/16.
//  Copyright © 2016 originate.com. All rights reserved.
//

#import "TextFieldViewController.h"
#import "CodeViewController.h"
@import OriginateUI;

@interface TextFieldViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) OriginateValidatedTextField *textField;
@property (nonatomic, assign) BOOL currentlyValid;
@property (nonatomic, strong) UIButton* codeButton;
@property (nonatomic, strong) UIButton* insetButton;

@end

@implementation TextFieldViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = NSLocalizedString(@"Text Fields", nil);
}

- (void)loadView
{
    [super loadView];
    [self.view addSubview:self.textField];
    [self.view addSubview:self.label];
    [self.view addSubview:self.codeButton];
    [self.view addSubview:self.insetButton];
    
    [self.textField setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textField
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.label
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:40]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textField
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1.0
                                                           constant:10]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textField
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.67
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textField
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:0.2
                                                           constant:0]];
    
    [self.label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.label
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:80]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.label
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.label
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.95
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.label
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.5
                                                           constant:0]];
    
    [self.codeButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.codeButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-5]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.codeButton
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1.0
                                                           constant:-5]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.codeButton
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:0.0
                                                           constant:100]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.codeButton
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:0.0
                                                           constant:40]];
    
    [self.insetButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.insetButton
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.textField
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.insetButton
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.textField
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1.0
                                                           constant:20]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.insetButton
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.15
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.insetButton
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:0.1
                                                           constant:0]];
}

- (OriginateValidatedTextField *)textField
{
    if (!_textField){
        _textField = [[OriginateValidatedTextField alloc] init];
        _textField.delegate = self;
        _textField.backgroundColor = [UIColor hex:0x007AFF alpha:0.5];
        [_textField setReturnKeyType:UIReturnKeyDone];
        _textField.validationMode = OriginateTextFieldValidationModeLive;
        _textField.validationBlock = ^BOOL(NSString *text) {
            NSArray *strings = [text componentsSeparatedByString:@","];
            return (([strings count] == 4) && ([strings[0] intValue]) && ([strings[1] intValue]) &&
                    ([strings[2] intValue]) && ([strings[3] intValue])) ;
        };
        _textField.validationChangedBlock = ^(BOOL isValid, OriginateValidatedTextField *textField) {
            if (isValid) {
                _currentlyValid = YES;
                textField.backgroundColor = [UIColor hex:0x007AFF alpha:0.5];
            }
            else {
                _currentlyValid = NO;
                textField.backgroundColor = [UIColor hex:0xFF3B30 alpha:0.5];
            }
        };
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.textEdgeInsets = UIEdgeInsetsMake(10.0, 15.0, 5.0, 5.0);
        _textField.text = @"10.0, 15.0, 5.0, 5.0";
    }
    return _textField;
}

- (UILabel *) label
{
    if (!_label){
        _label = [[UILabel alloc] init];
        _label.text = NSLocalizedString(@"UITextField has no convenient way to specify insets for the text"
            "rendering. OriginateTextField solves the problem by exposing the following interface.\n\n"
            "Observe and set the insets of the text below.\nPlease enter four values", nil);
        _label.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 18];
        _label.numberOfLines = 0;
    }
    return _label;
}

- (UIButton *) codeButton
{
    if (!_codeButton) {
        _codeButton = [[UIButton alloc] init];
        _codeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_codeButton setTitle:NSLocalizedString(@"Code", nil) forState:UIControlStateNormal];
        [_codeButton addTarget:self action:@selector(codeButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    }
    return _codeButton;
}

- (UIButton *) insetButton
{
    if (!_insetButton) {
        _insetButton = [[UIButton alloc] init];
        _insetButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_insetButton setTitle:NSLocalizedString(@"Go", nil) forState:UIControlStateNormal];
        _insetButton.titleLabel.font = [UIFont systemFontOfSize:22];
        [_insetButton addTarget:self action:@selector(insetButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    }
    return _insetButton;
}

- (void)insetButtonPressed
{
    if (self.currentlyValid) {
        NSArray *strings = [self.textField.text componentsSeparatedByString:@","];
        NSString *myString = self.textField.text;
        self.textField.textEdgeInsets = UIEdgeInsetsMake([strings[0] integerValue], [strings[1] integerValue],
                                                         [strings[2] integerValue], [strings[3] integerValue]);
        self.textField.text = myString;
    }
}

- (void)codeButtonPressed
{
    NSString *codeText = @"OriginateTextField *textField = [[OriginateTextField alloc] init];\n"
    "textField.textEdgeInsets = UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0);";
    CodeViewController *codeView = [[CodeViewController alloc] initWithText:codeText];
    [self.navigationController pushViewController:codeView animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

@end
