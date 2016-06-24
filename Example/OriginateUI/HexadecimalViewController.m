//
//  HexadecimalViewController.m
//  OriginateUI
//
//  Created by Seth Rainha on 6/22/16.
//  Copyright © 2016 originate.com. All rights reserved.
//

#import "HexadecimalViewController.h"
#import "CodeViewController.h"

@interface HexadecimalViewController ()

@property UIView *hexView;
@property UILabel *label;
@property UILabel *label1;
@property UILabel *label2;
@property (nonatomic, strong) OriginateValidatedTextField *hexTextField;
@property (nonatomic, strong) OriginateValidatedTextField *opacityTextField;
@property BOOL firstValid;
@property BOOL secondValid;

@end

@implementation HexadecimalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"Hexadecimal Colors";
    int screenHeight = self.view.frame.size.height;
    int screenWidth = self.view.frame.size.width;
    self.firstValid = YES;
    self.secondValid = YES;
    [self labelCreate];
    [self textFieldCreate];
    //Code button setup
    UIButton *codeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    codeButton.frame = CGRectMake((self.view.frame.size.width-110),(self.view.frame.size.height-48), 110.0f, 40.0f);
    [codeButton setTitle:@"Code" forState:UIControlStateNormal];
    [codeButton addTarget:self action:@selector(codeButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:codeButton];
    //hexButton setup
    UIButton *hexButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    hexButton.frame = CGRectMake((screenWidth*0.5-55.0),(screenHeight*0.35), 110.0, 40.0);
    [hexButton setTitle:@"Go" forState:UIControlStateNormal];
    hexButton.titleLabel.font = [UIFont systemFontOfSize:22];
    [hexButton addTarget:self action:@selector(hexButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:hexButton];
    //Hex color view
    CGRect  viewRect = CGRectMake(screenWidth*0.5-50.0, screenHeight*0.45, 100.0, 100.0);
    self.hexView = [[UIView alloc] initWithFrame:viewRect];
    self.hexView.backgroundColor = [UIColor hex:0xFF2D55 alpha:0.9];
    self.hexView.layer.cornerRadius = 8.0;
    self.hexView.layer.masksToBounds = YES;
    [self.view addSubview:self.hexView];
}

- (void) labelCreate
{
    int screenHeight = self.view.frame.size.height;
    int screenWidth = self.view.frame.size.width;
    //Label
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.05, (screenHeight*0.6), (screenWidth*0.9), (screenHeight*0.3))];
    self.label.text = @"Most designers work with colors using the hexadecimal system. UIColor by default only really works well with plain RGB values between 0 and 1.";
    self.label.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 20];
    self.label.numberOfLines = 0;
    [self.view addSubview:self.label];
    //Label1
    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.1, screenHeight*0.15, (screenWidth*0.75), (30.0))];
    self.label1.text = @"Hex string";
    self.label1.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 20];
    self.label1.numberOfLines = 0;
    [self.view addSubview:self.label1];
    //Label2
    self.label2 = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.1, (screenHeight*0.25), (screenWidth*0.75), 30.0)];
    self.label2.text = @"Opacity";
    self.label2.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 20];
    self.label2.numberOfLines = 0;
    [self.view addSubview:self.label2];

}

- (void) textFieldCreate
{
    int screenHeight = self.view.frame.size.height;
    int screenWidth = self.view.frame.size.width;
    //Hex code text field
    self.hexTextField = [[OriginateValidatedTextField alloc] init];
    self.hexTextField.frame = CGRectMake(screenWidth*0.55, screenHeight*0.15, 140.0, 30.0);
    self.hexTextField.delegate = self;
    self.hexTextField.backgroundColor = [UIColor hex:0x007AFF alpha:0.5];
    [self.hexTextField setReturnKeyType:UIReturnKeyDone];
    self.hexTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.hexTextField.validationMode = OriginateTextFieldValidationModeLive;
    self.hexTextField.validationBlock = ^BOOL(NSString *text) {
        NSUInteger inputLength = [text length];
        NSCharacterSet *chars = [[NSCharacterSet
                                  characterSetWithCharactersInString:@"0123456789ABCDEF"] invertedSet];
        NSString *slicedInput = [text substringFromIndex:[text length] - 1];
        BOOL isValid =  (NSNotFound == [slicedInput rangeOfCharacterFromSet:chars].location) && (inputLength == 7);
        return isValid;
    };
    self.hexTextField.validationChangedBlock = ^(BOOL isValid, OriginateValidatedTextField *textField) {
        if (isValid) {
            _firstValid = YES;
            textField.backgroundColor = [UIColor hex:0x007AFF alpha:0.5];
        }
        else {
            _firstValid = NO;
            textField.backgroundColor = [UIColor hex:0xFF3B30 alpha:0.5];
        }
    };
    self.hexTextField.text = @"#FF2D55";
    self.hexTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:self.hexTextField];
    //Opacity text field
    self.opacityTextField = [[OriginateValidatedTextField alloc] init];
    self.opacityTextField.delegate = self;
    self.opacityTextField.frame = CGRectMake(screenWidth*0.55, screenHeight*0.25, 140.0, 30.0);
    self.opacityTextField.backgroundColor = [UIColor hex:0x007AFF alpha:0.5];
    [self.opacityTextField setReturnKeyType:UIReturnKeyDone];
    self.opacityTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.opacityTextField.validationMode = OriginateTextFieldValidationModeLive;
    self.opacityTextField.validationBlock = ^BOOL(NSString *text) {
        if ([text floatValue]) {
            double myDouble = [text doubleValue];
            return (myDouble <= 1) && (0<= myDouble);
        }
        return NO;
    };
    self.opacityTextField.validationChangedBlock = ^(BOOL isValid, OriginateValidatedTextField *textField) {
        if (isValid) {
            _secondValid = YES;
            textField.backgroundColor = [UIColor hex:0x007AFF alpha:0.5];
        }
        else {
            _secondValid = NO;
            textField.backgroundColor = [UIColor hex:0xFF3B30 alpha:0.5];
        }
    };
    self.opacityTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.opacityTextField.text = @"0.9";
    [self.view addSubview:self.opacityTextField];
}
- (UIColor *)colorFromHexString:(NSString *)hexString
{
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1];
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

- (void)hexButtonPressed
{
    if (!_firstValid || !_secondValid) {
        return;
    }
    NSString *top = self.hexTextField.text;
    NSString *bottom = self.opacityTextField.text;
    UIColor *newColor = [self colorFromHexString:top];
    newColor = [newColor colorWithAlphaComponent:[bottom doubleValue]];
    self.hexView.backgroundColor = newColor;
}

- (void)codeButton
{
    CodeViewController *codeView = [[CodeViewController alloc] init];
    codeView.myString = @"// Red\n"
    "UIColor *redColor = [UIColor hex:0xFF0000];\n"
   " // Green at 50% Opacity\n"
    "UIColor *redColor = [UIColor hex:0x00FF00 alpha:0.5];";
    [self.navigationController pushViewController:codeView animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

@end
