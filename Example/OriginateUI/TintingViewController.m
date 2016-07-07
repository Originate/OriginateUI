//
//  TintingViewController.m
//  OriginateUI
//
//  Created by Seth Rainha on 6/22/16.
//  Copyright © 2016 originate.com. All rights reserved.
//

#import "TintingViewController.h"
#import "CodeViewController.h"
@import OriginateUI;

@interface TintingViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *mainLabel;
@property (nonatomic, strong) UILabel *labelFirstColor;
@property (nonatomic, strong) UILabel *labelSecondColor;
@property (nonatomic, strong) OriginateValidatedTextField *textFieldFirst;
@property (nonatomic, strong) OriginateValidatedTextField *textFieldSecond;
@property (nonatomic, assign) BOOL firstValid;
@property (nonatomic, assign) BOOL secondValid;

@end

@implementation TintingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"Image Tinting";
    CGFloat screenHeight = CGRectGetHeight(self.view.frame);
    CGFloat screenWidth = CGRectGetWidth(self.view.frame);
    self.firstValid = YES;
    self.secondValid = YES;
    [self.view addSubview:self.mainLabel];
    [self.view addSubview:self.labelFirstColor];
    [self.view addSubview:self.labelSecondColor];
    [self.view addSubview:self.textFieldFirst];
    [self.view addSubview:self.textFieldSecond];
    [self.view addSubview:self.imageView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(screenWidth-110.0,screenHeight-48.0, 110.0, 40.0);
    [button setTitle:@"Code" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    UIButton *vButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    vButton.frame = CGRectMake((screenWidth*0.5-55.0), screenHeight*0.55, 110.0, 50.0);
    vButton.titleLabel.font = [UIFont systemFontOfSize:22];
    [vButton setTitle:@"Tint" forState:UIControlStateNormal];
    [vButton addTarget:self action:@selector(tintButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:vButton];
    
}

- (UILabel *)mainLabel
{
    if (!_mainLabel){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.05, (screenHeight*0.6), (screenWidth*0.9), (screenHeight*0.3))];
        self.mainLabel.text = @"To make the tinting of images easier, we provide two methods on UIImage. You can also easily modify the opacity. ";
        self.mainLabel.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 20];
        self.mainLabel.numberOfLines = 0;
    }
    return _mainLabel;
}

- (UILabel *)labelFirstColor
{
    if (!_labelFirstColor){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.labelFirstColor = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.1, screenHeight*0.35, (screenWidth*0.75), (30.0))];
        self.labelFirstColor.text = @"Tint color";
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
        self.labelSecondColor = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.1, (screenHeight*0.45), (screenWidth*0.75), 30.0)];
        self.labelSecondColor.text = @"Opacity";
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
        self.textFieldFirst.frame = CGRectMake(screenWidth*0.55, screenHeight*0.35, 140.0, 30.0);
        self.textFieldFirst.delegate = self;
        self.textFieldFirst.backgroundColor = [UIColor hex:0x007AFF alpha:0.5];
        [self.textFieldFirst setReturnKeyType:UIReturnKeyDone];
        self.textFieldFirst.borderStyle = UITextBorderStyleRoundedRect;
        self.textFieldFirst.validationMode = OriginateTextFieldValidationModeLive;
        self.textFieldFirst.validationBlock = ^BOOL(NSString *text) {
            NSArray *allColors = @[ @"blueColor", @"redColor", @"greenColor", @"blackColor", @"whiteColor", @"orangeColor", @"brownColor", @"purpleColor", @"yellowColor", @"grayColor", @"magentaColor", @"cyanColor", @"lightGrayColor", @"darkGrayColor", @"clearColor"];
            BOOL colorCheck = [allColors containsObject: text];
            return (colorCheck);
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
        self.textFieldFirst.text = @"blueColor";
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
        self.textFieldSecond.frame = CGRectMake(screenWidth*0.55, screenHeight*0.45, 140.0, 30.0);
        self.textFieldSecond.delegate = self;
        self.textFieldSecond.backgroundColor = [UIColor hex:0x007AFF alpha:0.5];
        [self.textFieldSecond setReturnKeyType:UIReturnKeyDone];
        self.textFieldSecond.borderStyle = UITextBorderStyleRoundedRect;
        self.textFieldSecond.validationMode = OriginateTextFieldValidationModeLive;
        self.textFieldSecond.validationBlock = ^BOOL(NSString *text) {
            if ([text floatValue]) {
                double myDouble = [text doubleValue];
                return (myDouble <= 1) && (0<= myDouble);
            }
            return NO;
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
        self.textFieldSecond.text = @"0.9";
    }
    return _textFieldSecond;
}

- (UIImageView *)imageView
{
    if (!_imageView){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.imageView =[[UIImageView alloc] initWithFrame:CGRectMake(screenWidth*0.5-150.0,screenHeight*0.2, 300.0, 84.3)];
        UIImage *logo = [UIImage imageNamed:@"Originate.png"];
        UIImage *blueLogo = [logo imageTintedWithColor:[UIColor blueColor]];
        self.imageView.image = blueLogo;
    }
    return _imageView;
}

- (void)tintButton
{
    if (!_firstValid || !_secondValid) {
        return;
    }
    SEL labelFirst = NSSelectorFromString(self.textFieldFirst.text);
    UIColor *newTint = [UIColor performSelector:labelFirst];
    newTint = [newTint colorWithAlphaComponent:[self.textFieldSecond.text doubleValue]];
    self.imageView.image  = [self.imageView.image imageTintedWithColor:newTint];
    [self.view addSubview:self.imageView];
}

- (void)buttonPressed
{
    CodeViewController *codeView = [[CodeViewController alloc] init];
    codeView.myString = @"UIImage *logo = [UIImage imageNamed:@\"logo\"];\n"
    "UIImage *blackLogo = [logo imageTintedWithColor:[UIColor blackColor]];";
    [self.navigationController pushViewController:codeView animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}


@end
