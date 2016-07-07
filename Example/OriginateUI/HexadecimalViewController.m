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

@property (nonatomic, strong) UIView *hexView;
@property (nonatomic, strong) UILabel *mainLabel;
@property (nonatomic, strong) UILabel *hexLabel;
@property (nonatomic, strong) UILabel *opacityLabel;
@property (nonatomic, strong) OriginateValidatedTextField *hexTextField;
@property (nonatomic, strong) OriginateValidatedTextField *opacityTextField;
@property (nonatomic, assign) BOOL firstValid;
@property (nonatomic, assign) BOOL secondValid;

@end

@implementation HexadecimalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Hexadecimal Colors";
    CGFloat screenHeight = CGRectGetHeight(self.view.frame);
    CGFloat screenWidth = CGRectGetWidth(self.view.frame);
    self.firstValid = YES;
    self.secondValid = YES;
    [self.view addSubview:self.mainLabel];
    [self.view addSubview:self.hexLabel];
    [self.view addSubview:self.opacityLabel];
    [self.view addSubview:self.hexTextField];
    [self.view addSubview:self.opacityTextField];
    
    UIButton *codeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    codeButton.frame = CGRectMake((self.view.frame.size.width-110),(self.view.frame.size.height-48), 110.0f, 40.0f);
    [codeButton setTitle:@"Code" forState:UIControlStateNormal];
    [codeButton addTarget:self action:@selector(codeButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:codeButton];

    UIButton *hexButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    hexButton.frame = CGRectMake((screenWidth*0.5-55.0),(screenHeight*0.35), 110.0, 40.0);
    [hexButton setTitle:@"Go" forState:UIControlStateNormal];
    hexButton.titleLabel.font = [UIFont systemFontOfSize:22];
    [hexButton addTarget:self action:@selector(hexButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:hexButton];
    [self.view addSubview:self.hexView];
}

- (UIView *)hexView
{
    if (!_hexView){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        CGRect  viewRect = CGRectMake(screenWidth*0.5-50.0, screenHeight*0.45, 100.0, 100.0);
        self.hexView = [[UIView alloc] initWithFrame:viewRect];
        self.hexView.backgroundColor = [UIColor hex:0xFF2D55 alpha:0.9];
        self.hexView.layer.cornerRadius = 8.0;
        self.hexView.layer.masksToBounds = YES;
    }
    return _hexView;
}

- (UILabel *)mainLabel
{
    if (!_mainLabel){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.05, (screenHeight*0.6), (screenWidth*0.9), (screenHeight*0.3))];
        self.mainLabel.text = @"Most designers work with colors using the hexadecimal system. UIColor by default only really works well with plain RGB values between 0 and 1.";
        self.mainLabel.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 20];
        self.mainLabel.numberOfLines = 0;
    }
    return _mainLabel;
}

- (UILabel *)hexLabel
{
    if (!_hexLabel){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.hexLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.1, screenHeight*0.15, (screenWidth*0.75), (30.0))];
        self.hexLabel.text = @"Hex string";
        self.hexLabel.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 20];
        self.hexLabel.numberOfLines = 0;
    }
    return _hexLabel;
}

- (UILabel *)opacityLabel
{
    if (!_opacityLabel){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.opacityLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.1, (screenHeight*0.25), (screenWidth*0.75), 30.0)];
        self.opacityLabel.text = @"Opacity";
        self.opacityLabel.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 20];
        self.opacityLabel.numberOfLines = 0;
    }
    return _opacityLabel;
}

- (OriginateValidatedTextField *)hexTextField
{   if (!_hexTextField){
    CGFloat screenHeight = CGRectGetHeight(self.view.frame);
    CGFloat screenWidth = CGRectGetWidth(self.view.frame);
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
    }
    return _hexTextField;
}

- (OriginateValidatedTextField *)opacityTextField
{
    if (!_opacityTextField){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
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
    }
    return _opacityTextField;
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
