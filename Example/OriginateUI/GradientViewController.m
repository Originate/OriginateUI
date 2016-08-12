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
@property (nonatomic, strong) UIButton *codeButton;
@property (nonatomic, strong) UIButton *buttonGradient;

@end

@implementation GradientViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = NSLocalizedString(@"Gradient Views", nil);
    self.firstValid = YES;
    self.secondValid = YES;
}

- (void)loadView
{
    [super loadView];
    [self.view addSubview:self.mainLabel];
    [self.view addSubview:self.labelFirstColor];
    [self.view addSubview:self.labelSecondColor];
    [self.view addSubview:self.textFieldFirst];
    [self.view addSubview:self.textFieldSecond];
    [self.view addSubview:self.gradientView];
    [self.view addSubview:self.codeButton];
    [self.view addSubview:self.buttonGradient];
    
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
    
    [self.buttonGradient setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.buttonGradient
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.buttonGradient
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.gradientView
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:10.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.buttonGradient
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:0.0
                                                           constant:50]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.buttonGradient
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:0.0
                                                           constant:50]];
    
    [self.mainLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.mainLabel
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.buttonGradient
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:10]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.mainLabel
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:0.3
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.mainLabel
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.mainLabel
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.95
                                                           constant:0]];
    /////////////////
    
    [self.labelFirstColor setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.labelFirstColor
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:80.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.labelFirstColor
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1.0
                                                           constant:10.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.labelFirstColor
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.4
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.labelFirstColor
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:0.0
                                                           constant:50]];
    
    [self.labelSecondColor setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.labelSecondColor
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.labelFirstColor
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:50.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.labelSecondColor
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1.0
                                                           constant:10.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.labelSecondColor
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.4
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.labelSecondColor
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:0.0
                                                           constant:50]];
    
    [self.textFieldFirst setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textFieldFirst
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:80.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textFieldFirst
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1.0
                                                           constant:-10.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textFieldFirst
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.4
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textFieldFirst
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:0.0
                                                           constant:40]];
    
    [self.textFieldSecond setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textFieldSecond
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.textFieldFirst
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:50.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textFieldSecond
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1.0
                                                           constant:-10.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textFieldSecond
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.4
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textFieldSecond
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:0.0
                                                           constant:40]];
    
    [self.gradientView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.gradientView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.gradientView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.textFieldSecond
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:30.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.gradientView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:0.0
                                                           constant:80]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.gradientView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:0.0
                                                           constant:80]];
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

- (UIButton *) buttonGradient
{
    if (!_buttonGradient) {
        _buttonGradient = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_buttonGradient setTitle:NSLocalizedString(@"Go", nil) forState:UIControlStateNormal];
        _buttonGradient.titleLabel.font = [UIFont systemFontOfSize:22];
        [_buttonGradient addTarget:self action:@selector(buttonGradientPressed)
                 forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonGradient;
}

- (UILabel *)mainLabel
{
    if (!_mainLabel){
        _mainLabel = [[UILabel alloc] init];
        _mainLabel.text = NSLocalizedString(@"Whilst CoreAnimation provides us with CAGradientLayer "
                    "it is not as comfortable to use as one would like. For this reason we supply Originate "
                    "Gradient View. This is also compatible with IBInspectable and IBDesignable. Simply open a "
                    "view in a xib or storyboard, and set it to Gradient View. There the attributes of the first "
                    "and second colors can be seen and modified.", nil);
        _mainLabel.font = [self.mainLabel.font fontWithSize:16];
        _mainLabel.numberOfLines = 0;
    }
    return _mainLabel;
}

- (UILabel *)labelFirstColor
{
    if (!_labelFirstColor){
        _labelFirstColor = [[UILabel alloc] init];
        _labelFirstColor.text = NSLocalizedString(@"First color", nil);
        _labelFirstColor.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 20];
        _labelFirstColor.numberOfLines = 0;
    }
    return _labelFirstColor;
}

- (UILabel *)labelSecondColor
{
    if (!_labelSecondColor){

        _labelSecondColor = [[UILabel alloc] init];
        _labelSecondColor.text = NSLocalizedString(@"Second color", nil);
        _labelSecondColor.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 20];
        _labelSecondColor.numberOfLines = 0;
    }
    return _labelSecondColor;
}

- (UITextField *)textFieldFirst
{
    if (!_textFieldFirst){
        _textFieldFirst = [[OriginateValidatedTextField alloc] init];
        _textFieldFirst.delegate = self;
        _textFieldFirst.backgroundColor = [UIColor hex:0x007AFF alpha:0.5];
        [_textFieldFirst setReturnKeyType:UIReturnKeyDone];
        _textFieldFirst.borderStyle = UITextBorderStyleRoundedRect;
        _textFieldFirst.validationMode = OriginateTextFieldValidationModeLive;
        _textFieldFirst.validationBlock = ^BOOL(NSString *text) {
            NSString *topText = text;
            NSArray *allColors = @[ @"blueColor", @"redColor", @"greenColor", @"blackColor",
                                    @"whiteColor", @"orangeColor", @"brownColor", @"purpleColor",
                                    @"yellowColor", @"grayColor", @"magentaColor", @"cyanColor",
                                    @"lightGrayColor", @"darkGrayColor", @"clearColor"];
            BOOL firstCheck = [allColors containsObject: topText];
            return (firstCheck);
        };
        _textFieldFirst.validationChangedBlock = ^(BOOL isValid, OriginateValidatedTextField *textField) {
            if (isValid) {
                _firstValid = YES;
                textField.backgroundColor = [UIColor hex:0x007AFF alpha:0.5];
            }
            else {
                _firstValid = NO;
                textField.backgroundColor = [UIColor hex:0xFF3B30 alpha:0.5];
            }
        };
        _textFieldFirst.text = @"yellowColor";
        _textFieldFirst.autocapitalizationType = UITextAutocapitalizationTypeNone;
    }
    return _textFieldFirst;
}

- (UITextField *)textFieldSecond
{
    if (!_textFieldSecond){

        _textFieldSecond = [[OriginateValidatedTextField alloc] init];
        _textFieldSecond.delegate = self;
        _textFieldSecond.backgroundColor = [UIColor hex:0x007AFF alpha:0.5];
        [_textFieldSecond setReturnKeyType:UIReturnKeyDone];
        _textFieldSecond.borderStyle = UITextBorderStyleRoundedRect;
        _textFieldSecond.validationMode = OriginateTextFieldValidationModeLive;
        _textFieldSecond.validationBlock = ^BOOL(NSString *text) {
            NSString *bottomText = text;
            NSArray *allColors = @[ @"blueColor", @"redColor", @"greenColor", @"blackColor",
                                    @"whiteColor", @"orangeColor", @"brownColor", @"purpleColor",
                                    @"yellowColor", @"grayColor", @"magentaColor", @"cyanColor",
                                    @"lightGrayColor", @"darkGrayColor", @"clearColor"];
            BOOL secondCheck = [allColors containsObject: bottomText];
            return (secondCheck);
        };
        _textFieldSecond.validationChangedBlock = ^(BOOL isValid, OriginateValidatedTextField *textField) {
            if (isValid) {
                _secondValid = YES;
                textField.backgroundColor = [UIColor hex:0x007AFF alpha:0.5];
            }
            else {
                _secondValid = NO;
                textField.backgroundColor = [UIColor hex:0xFF3B30 alpha:0.5];
            }
        };
        _textFieldSecond.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _textFieldSecond.text = @"cyanColor";
    }
    return _textFieldSecond;
}

- (OriginateGradientView *)gradientView
{
    if (!_gradientView){
        _gradientView = [[OriginateGradientView alloc] init];
        _gradientView.firstColor = [UIColor yellowColor];
        _gradientView.secondColor = [UIColor cyanColor];
        _gradientView.layer.cornerRadius = 8.0;
        _gradientView.layer.masksToBounds = YES;
    }
    return _gradientView;
}

- (void)codeButtonPressed
{
    NSString *codeText = @"UIColor *topColor = [UIColor whiteColor];\n"
        "UIColor *blackColor = [UIColor blackColor];\n"
        "OriginateGradientView *view = [[OriginateGradientView alloc]"
        "initWithFirstColor:topColor secondColor:blackColor];\n";
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
