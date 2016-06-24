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

@interface ValidationViewController ()

@property OriginateValidatedTextField *textField;
@property UILabel *label;

@end

@implementation ValidationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"Validating TextFields";
    int screenHeight = self.view.frame.size.height;
    int screenWidth = self.view.frame.size.width;
    //Code button setup
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(screenWidth-100.0,screenHeight-48.0, 110.0, 40.0);
    [button setTitle:@"Code" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    //Label setup
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.05, (screenHeight*0.35), (screenWidth*0.9), (screenHeight*0.3))];
    self.label.text = @"When implementing registration forms, login masks or other types of forms that would benefit from any validation, use Originate Validated Text Field. \n\n Currently the validationMode is live, and the Block is length > 5. ";
    self.label.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 20];
    self.label.numberOfLines = 0;
    [self.view addSubview:self.label];
    //OriginateValidatedTextField
    self.textField = [[OriginateValidatedTextField alloc] init];
    self.textField.frame = CGRectMake((screenWidth*.125), (screenHeight*.15), (screenWidth*.75), 30);
    [self.textField setReturnKeyType:UIReturnKeyDone];
    self.textField.backgroundColor = [UIColor hex:0x007AFF alpha:0.5];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.text = @"This is valid.";
    self.textField.validationMode = OriginateTextFieldValidationModeLive;
    self.textField.validationBlock = ^BOOL(NSString *text) {
        return ([text length] > 5);
    };
    self.textField.validationChangedBlock = ^(BOOL isValid, OriginateValidatedTextField *textField) {
        if (isValid) {
            textField.backgroundColor = [UIColor hex:0x007AFF alpha:0.5];
        }
        else {
            textField.backgroundColor = [UIColor hex:0xFF3B30 alpha:0.5];
        }
    };
    self.textField.delegate = self;
    [self.view addSubview:self.textField];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}
    
- (void)buttonPressed
{
    CodeViewController *codeView = [[CodeViewController alloc] init];
    codeView.myString = @"OriginateValidatedTextField * textField = [[OriginateValidatedTextField alloc] init];\n"
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
    [self.navigationController pushViewController:codeView animated:YES];
}

@end
