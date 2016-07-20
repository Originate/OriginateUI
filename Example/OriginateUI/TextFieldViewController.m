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

@end

@implementation TextFieldViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = NSLocalizedString(@"Text Fields", nil);
    CGFloat screenHeight = CGRectGetHeight(self.view.frame);
    CGFloat screenWidth = CGRectGetWidth(self.view.frame);
    [self.view addSubview:self.textField];
    [self.view addSubview:self.label];

    UIButton *codeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    codeButton.frame = CGRectMake((screenWidth-110.0),(screenHeight-48.0), 110.0, 40.0);
    [codeButton setTitle:NSLocalizedString(@"Code", nil) forState:UIControlStateNormal];
    [codeButton addTarget:self action:@selector(codeButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:codeButton];

    UIButton *insetButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    insetButton.frame = CGRectMake((screenWidth*0.7),(screenHeight*0.575), 110.0, 40.0);
    [insetButton setTitle:NSLocalizedString(@"Go", nil) forState:UIControlStateNormal];
    insetButton.titleLabel.font = [UIFont systemFontOfSize:22];
    [insetButton addTarget:self action:@selector(insetButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:insetButton];
}

- (OriginateValidatedTextField *)textField
{
    if (!_textField){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.textField = [[OriginateValidatedTextField alloc] init];
        self.textField.frame = CGRectMake((screenWidth*0.05), (screenHeight*0.525), (screenWidth*0.7),
                                          (screenHeight*0.15));
        self.textField.delegate = self;
        self.textField.backgroundColor = [UIColor hex:0x007AFF alpha:0.5];
        [self.textField setReturnKeyType:UIReturnKeyDone];
        self.textField.validationMode = OriginateTextFieldValidationModeLive;
        self.textField.validationBlock = ^BOOL(NSString *text) {
            NSArray *strings = [text componentsSeparatedByString:@","];
            return (([strings count] == 4) && ([strings[0] intValue]) && ([strings[1] intValue]) &&
                    ([strings[2] intValue]) && ([strings[3] intValue])) ;
        };
        self.textField.validationChangedBlock = ^(BOOL isValid, OriginateValidatedTextField *textField) {
            if (isValid) {
                _currentlyValid = YES;
                textField.backgroundColor = [UIColor hex:0x007AFF alpha:0.5];
            }
            else {
                _currentlyValid = NO;
                textField.backgroundColor = [UIColor hex:0xFF3B30 alpha:0.5];
            }
        };
        self.textField.borderStyle = UITextBorderStyleRoundedRect;
        self.textField.textEdgeInsets = UIEdgeInsetsMake(10.0, 15.0, 5.0, 5.0);
        self.textField.text = @"10.0, 15.0, 5.0, 5.0";
    }
    return _textField;
}

- (UILabel *) label
{
    if (!_label){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.05, (screenHeight*0.1),
            (screenWidth*0.9), (screenHeight*0.5))];
        self.label.text = NSLocalizedString(@"UITextField has no convenient way to specify insets for the text"
            "rendering. OriginateTextField solves the problem by exposing the following interface.\n\n"
            "Observe and set the insets of the text below.\nPlease enter four values", nil);
        self.label.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 20];
        self.label.numberOfLines = 0;
    }
    return _label;
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
