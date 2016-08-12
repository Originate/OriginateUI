//
//  ValidationViewController.m
//  OriginateUI
//
//  Created by Seth Rainha on 6/22/16.
//  Copyright © 2016 originate.com. All rights reserved.
//

#import "ValidationViewController.h"
#import "CodeViewController.h"
@import OriginateUI;

@interface ValidationViewController () <UITextFieldDelegate>

@property (nonatomic, strong) OriginateValidatedTextField *textField;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton* codeButton;

@end

@implementation ValidationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = NSLocalizedString(@"Validating TextFields", nil);
}

- (void)loadView
{
    [super loadView];

    [self.view addSubview:self.codeButton];
    [self.view addSubview:self.label];
    [self.view addSubview:self.textField];
    
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
    
    [self.label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.label
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.textField
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:50]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.label
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:0.6
                                                           constant:0]];
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

    [self.textField setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textField
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textField
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:100]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textField
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.75
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textField
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:0.0
                                                           constant:30]];
}

- (OriginateValidatedTextField *)textField
{
    if (!_textField){
        _textField = [[OriginateValidatedTextField alloc] init];
        [_textField setReturnKeyType:UIReturnKeyDone];
        _textField.backgroundColor = [UIColor hex:0x007AFF alpha:0.5];
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.text = @"This is valid.";
        _textField.validationMode = OriginateTextFieldValidationModeLive;
        _textField.validationBlock = ^BOOL(NSString *text) {
            return ([text length] > 5);
        };
        _textField.validationChangedBlock = ^(BOOL isValid, OriginateValidatedTextField *textField) {
            if (isValid) {
                textField.backgroundColor = [UIColor hex:0x007AFF alpha:0.5];
            }
            else {
                textField.backgroundColor = [UIColor hex:0xFF3B30 alpha:0.5];
            }
        };
        self.textField.delegate = self;
    }
    return _textField;
}

- (UILabel *) label
{
    if (!_label){
        _label = [[UILabel alloc] init];
        _label.text = NSLocalizedString(@"When implementing registration forms, login masks or other types of"
        "forms that would benefit from any validation, use Originate Validated Text Field. \n\n Currently "
                                            "the validationMode is live, and the Block is length > 5. ", nil);
        _label.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 20];
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}
    
- (void)codeButtonPressed
{
    NSString *codeText = @"OriginateValidatedTextField * textField = [[OriginateValidatedTextField alloc] init];\n"
    "textField.validationMode = OriginateTextFieldValidationModeLive;\n"
    "textField.validationBlock = ^BOOL(NSString *text) {\n"
     "   return ([text length] > 5);\n"
    "};"
    "textField.validationChangedBlock = ^(BOOL isValid, OriginateValidatedTextField *textField) {\n"
      "  if (isValid) {\n"
      "      textField.backgroundColor = [UIColor whiteColor];\n"
       " }\n"
      "  else {"
     "       textField.backgroundColor = [UIColor redColor];\n"
    "    }\n"
    "};\n";
    CodeViewController *codeView = [[CodeViewController alloc] initWithText:codeText];
    [self.navigationController pushViewController:codeView animated:YES];
}

@end
