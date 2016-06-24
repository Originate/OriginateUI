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

@interface TextFieldViewController ()

@property UILabel *label;
@property OriginateValidatedTextField *textField;
@property BOOL currentlyValid;

@end

@implementation TextFieldViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"Text Fields";
    int screenHeight = self.view.frame.size.height;
    int screenWidth = self.view.frame.size.width;
    //Originate (Validated) TextField
    self.textField = [[OriginateValidatedTextField alloc] init];
    self.textField.frame = CGRectMake((screenWidth*0.05), (screenHeight*0.525), (screenWidth*0.7), (screenHeight*0.15));
    self.textField.delegate = self;
    self.textField.backgroundColor = [UIColor hex:0x007AFF alpha:0.5];
    [self.textField setReturnKeyType:UIReturnKeyDone];
    self.textField.validationMode = OriginateTextFieldValidationModeLive;
    self.textField.validationBlock = ^BOOL(NSString *text) {
        NSArray *strings = [text componentsSeparatedByString:@","];
        return (([strings count] == 4) && ([strings[0] intValue]) && ([strings[1] intValue]) && ([strings[2] intValue]) && ([strings[3] intValue])) ;
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
    [self.view addSubview:self.textField];
    //Label
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.05, (screenHeight*0.1), (screenWidth*0.9), (screenHeight*0.5))];
    self.label.text = @"UITextField has no convenient way to specify insets for the text rendering. OriginateTextField solves the problem by exposing the following interface.\n\n Observe and set the insets of the text below.\nPlease enter four values";
    self.label.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 20];
    self.label.numberOfLines = 0;
    [self.view addSubview:self.label];
    //Code button setup
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake((screenWidth-110.0),(screenHeight-48.0), 110.0, 40.0);
    [button setTitle:@"Code" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    //insetButton setup
    UIButton *insetButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    insetButton.frame = CGRectMake((screenWidth*0.7),(screenHeight*0.575), 110.0, 40.0);
    [insetButton setTitle:@"Go" forState:UIControlStateNormal];
    insetButton.titleLabel.font = [UIFont systemFontOfSize:22];
    [insetButton addTarget:self action:@selector(insetButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:insetButton];
}

- (void)insetButtonPressed
{
    if (self.currentlyValid) {
        NSArray *strings = [self.textField.text componentsSeparatedByString:@","];
        NSString *myString = self.textField.text;
        self.textField.textEdgeInsets = UIEdgeInsetsMake([strings[0] integerValue], [strings[1] integerValue], [strings[2] integerValue], [strings[3] integerValue]);
        self.textField.text = myString;
    }
}

- (void)buttonPressed
{
    CodeViewController *codeView = [[CodeViewController alloc] init];
    codeView.myString = @"OriginateTextField *textField = [[OriginateTextField alloc] init];\n"
    "textField.textEdgeInsets = UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0);";
    [self.navigationController pushViewController:codeView animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

@end
