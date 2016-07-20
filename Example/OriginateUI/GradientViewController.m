//
//  GradientViewController.m
//  OriginateUI
//
//  Created by Seth Rainha on 6/22/16.
//  Copyright © 2016 originate.com. All rights reserved.
//

#import "GradientViewController.h"
#import "CodeViewController.h"
#import <QuartzCore/QuartzCore.h>
@import OriginateUI;

@interface GradientViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UILabel *mainLabel;
@property (nonatomic, strong) UILabel *labelFirstColor;
@property (nonatomic, strong) UILabel *labelSecondColor;
@property (nonatomic, strong) OriginateGradientView *gradientView;
@property (nonatomic, strong) OriginateValidatedTextField *textFieldFirst;
@property (nonatomic, strong) OriginateValidatedTextField *textFieldSecond;
@property (nonatomic, assign) BOOL firstValid;
@property (nonatomic, assign) BOOL secondValid;

@end

@implementation GradientViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Gradient Views";
    CGFloat screenHeight = CGRectGetHeight(self.view.frame);
    CGFloat screenWidth = CGRectGetWidth(self.view.frame);
    self.firstValid = YES;
    self.secondValid = YES;
    [self.view addSubview:self.mainLabel];
    [self.view addSubview:self.labelFirstColor];
    [self.view addSubview:self.labelSecondColor];
    [self.view addSubview:self.textFieldFirst];
    [self.view addSubview:self.textFieldSecond];
    [self.view addSubview:self.gradientView];

    UIButton *codeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    codeButton.frame = CGRectMake((screenWidth-110.0),(screenHeight-48.0), 110.0, 40.0);
    [codeButton setTitle:@"Code" forState:UIControlStateNormal];
    [codeButton addTarget:self action:@selector(codeButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:codeButton];

    UIButton *buttonGradient = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonGradient.frame = CGRectMake((screenWidth*0.5-55.0),(screenHeight*0.33), 110.0, 40.0);
    [buttonGradient setTitle:@"Go" forState:UIControlStateNormal];
    buttonGradient.titleLabel.font = [UIFont systemFontOfSize:22];
    [buttonGradient addTarget:self action:@selector(buttonGradientPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonGradient];
}

- (UILabel *)mainLabel
{
    if (!_mainLabel){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.025, (screenHeight*0.55), (screenWidth*0.95), (screenHeight*0.4))];
        self.mainLabel.text = @"Whilst CoreAnimation provides us with CAGradientLayer it is not as comfortable to use as one would like. For this reason we supply Originate Gradient View. This is also compatible with IBInspectable and IBDesignable. Simply open a view in a xib or storyboard, and set it to Gradient View. There the attributes of the first and second colors can be seen and modified.";
        self.mainLabel.font = [self.mainLabel.font fontWithSize:16];
        self.mainLabel.numberOfLines = 0;
    }
    return _mainLabel;
}

- (UILabel *)labelFirstColor
{
    if (!_labelFirstColor){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.labelFirstColor = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.1, screenHeight*0.15, (screenWidth*0.75), (30.0))];
        self.labelFirstColor.text = @"First color";
        self.labelFirstColor.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 20];
        self.labelFirstColor.numberOfLines = 0;
    }
    return _labelFirstColor;
}

- (UILabel *)labelSecondColor
{
    if (!_labelSecondColor){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.labelSecondColor = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.1, (screenHeight*0.25), (screenWidth*0.75), 30.0)];
        self.labelSecondColor.text = @"Second color";
        self.labelSecondColor.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 20];
        self.labelSecondColor.numberOfLines = 0;
    }
    return _labelSecondColor;
}

- (UITextField *)textFieldFirst
{
    if (!_textFieldFirst){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.textFieldFirst = [[OriginateValidatedTextField alloc] init];
        self.textFieldFirst.frame = CGRectMake(screenWidth*0.55, screenHeight*0.15, 140.0, 30.0);
        self.textFieldFirst.delegate = self;
        self.textFieldFirst.backgroundColor = [UIColor hex:0x007AFF alpha:0.5];
        [self.textFieldFirst setReturnKeyType:UIReturnKeyDone];
        self.textFieldFirst.borderStyle = UITextBorderStyleRoundedRect;
        self.textFieldFirst.validationMode = OriginateTextFieldValidationModeLive;
        self.textFieldFirst.validationBlock = ^BOOL(NSString *text) {
            NSString *topText = text;
            NSArray *allColors = @[ @"blueColor", @"redColor", @"greenColor", @"blackColor", @"whiteColor", @"orangeColor", @"brownColor", @"purpleColor", @"yellowColor", @"grayColor", @"magentaColor", @"cyanColor", @"lightGrayColor", @"darkGrayColor", @"clearColor"];
            BOOL firstCheck = [allColors containsObject: topText];
            return (firstCheck);
        };
        self.textFieldFirst.validationChangedBlock = ^(BOOL isValid, OriginateValidatedTextField *textField) {
            if (isValid) {
                _firstValid = YES;
                textField.backgroundColor = [UIColor hex:0x007AFF alpha:0.5];
            }
            else {
                _firstValid = NO;
                textField.backgroundColor = [UIColor hex:0xFF3B30 alpha:0.5];
            }
        };
        self.textFieldFirst.text = @"yellowColor";
        self.textFieldFirst.autocapitalizationType = UITextAutocapitalizationTypeNone;
    }
    return _textFieldFirst;
}

- (UITextField *)textFieldSecond
{
    if (!_textFieldSecond){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.textFieldSecond = [[OriginateValidatedTextField alloc] init];
        self.textFieldSecond.frame = CGRectMake(screenWidth*0.55, screenHeight*0.25, 140.0, 30.0);
        self.textFieldSecond.delegate = self;
        self.textFieldSecond.backgroundColor = [UIColor hex:0x007AFF alpha:0.5];
        [self.textFieldSecond setReturnKeyType:UIReturnKeyDone];
        self.textFieldSecond.borderStyle = UITextBorderStyleRoundedRect;
        self.textFieldSecond.validationMode = OriginateTextFieldValidationModeLive;
        self.textFieldSecond.validationBlock = ^BOOL(NSString *text) {
            NSString *bottomText = text;
            NSArray *allColors = @[ @"blueColor", @"redColor", @"greenColor", @"blackColor", @"whiteColor", @"orangeColor", @"brownColor", @"purpleColor", @"yellowColor", @"grayColor", @"magentaColor", @"cyanColor", @"lightGrayColor", @"darkGrayColor", @"clearColor"];
            BOOL secondCheck = [allColors containsObject: bottomText];
            return (secondCheck);
        };
        self.textFieldSecond.validationChangedBlock = ^(BOOL isValid, OriginateValidatedTextField *textField) {
            if (isValid) {
                _secondValid = YES;
                textField.backgroundColor = [UIColor hex:0x007AFF alpha:0.5];
            }
            else {
                _secondValid = NO;
                textField.backgroundColor = [UIColor hex:0xFF3B30 alpha:0.5];
            }
        };
        self.textFieldSecond.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.textFieldSecond.text = @"cyanColor";
    }
    return _textFieldSecond;
}

- (OriginateGradientView *)gradientView
{
    if (!_gradientView){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        CGRect  viewRect = CGRectMake(screenWidth*0.5-50.0, screenHeight*0.4, 100.0, 100.0);
        self.gradientView = [[OriginateGradientView alloc] initWithFrame:viewRect];
        self.gradientView.firstColor = [UIColor yellowColor];
        self.gradientView.secondColor = [UIColor cyanColor];
        self.gradientView.layer.cornerRadius = 8.0;
        self.gradientView.layer.masksToBounds = YES;
    }
    return _gradientView;
}

- (void)codeButtonPressed
{
    NSString *codeText = @"UIColor *topColor = [UIColor whiteColor];\n"
    "UIColor *blackColor = [UIColor blackColor];\n"
    "OriginateGradientView *view = [[OriginateGradientView alloc] initWithFirstColor:topColor secondColor:blackColor];\n";
    CodeViewController *codeView = [[CodeViewController alloc] initWithText:codeText];
    [self.navigationController pushViewController:codeView animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (void)buttonGradientPressed
{
    if (!_firstValid || !_secondValid) {
        return;
    }
    NSString *top = self.textFieldFirst.text;
    NSString *bottom = self.textFieldSecond.text;
    SEL labelFirst = NSSelectorFromString(top);
    SEL labelSecond = NSSelectorFromString(bottom);
    UIColor *first = [UIColor performSelector:labelFirst];
    UIColor *color = [UIColor performSelector:labelSecond];
    self.gradientView.firstColor = first;
    self.gradientView.secondColor = color;
}

@end
