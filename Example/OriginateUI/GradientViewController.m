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

@interface GradientViewController ()

@property UILabel *label;
@property UILabel *label1;
@property UILabel *label2;
@property OriginateGradientView *gradientView;
@property (nonatomic, strong) OriginateValidatedTextField *textFieldFirst;
@property (nonatomic, strong) OriginateValidatedTextField *textFieldSecond;
@property BOOL firstValid;
@property BOOL secondValid;

@end

@implementation GradientViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"Gradient Views";
    int screenHeight = self.view.frame.size.height;
    int screenWidth = self.view.frame.size.width;
    self.firstValid = YES;
    self.secondValid = YES;
    [self labelCreate];
    [self textFieldCreate];
    //Gradient View
    CGRect  viewRect = CGRectMake(screenWidth*0.5-50.0, screenHeight*0.45, 100.0, 100.0);
    self.gradientView = [[OriginateGradientView alloc] initWithFrame:viewRect];
    self.gradientView.firstColor = [UIColor yellowColor];
    self.gradientView.secondColor = [UIColor cyanColor];
    self.gradientView.layer.cornerRadius = 8.0;
    self.gradientView.layer.masksToBounds = YES;
    [self.view addSubview:self.gradientView];
    //Code button setup
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake((screenWidth-110.0),(screenHeight-48.0), 110.0, 40.0);
    [button setTitle:@"Code" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    //ButtonGradient setup
    UIButton *buttonGradient = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonGradient.frame = CGRectMake((screenWidth*0.5-55.0),(screenHeight*0.35), 110.0, 40.0);
    [buttonGradient setTitle:@"Go" forState:UIControlStateNormal];
    buttonGradient.titleLabel.font = [UIFont systemFontOfSize:22];
    [buttonGradient addTarget:self action:@selector(buttonGradientPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonGradient];
}

- (void)labelCreate
{
    int screenHeight = self.view.frame.size.height;
    int screenWidth = self.view.frame.size.width;
    //Label
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.05, (screenHeight*0.6), (screenWidth*0.9), (screenHeight*0.3))];
    self.label.text = @"Whilst CoreAnimation provides us with CAGradientLayer it is not as comfortable to use as one would like. For this reason we supply Originate Gradient View.";
    self.label.font = [self.label.font fontWithSize:20];
    self.label.numberOfLines = 0;
    [self.view addSubview:self.label];
    //Label1
    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.1, screenHeight*0.15, (screenWidth*0.75), (30.0))];
    self.label1.text = @"First color";
    self.label1.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 20];
    self.label1.numberOfLines = 0;
    [self.view addSubview:self.label1];
    //Label2
    self.label2 = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.1, (screenHeight*0.25), (screenWidth*0.75), 30.0)];
    self.label2.text = @"Second color";
    self.label2.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 20];
    self.label2.numberOfLines = 0;
    [self.view addSubview:self.label2];
}

- (void)textFieldCreate
{
    int screenHeight = self.view.frame.size.height;
    int screenWidth = self.view.frame.size.width;
    //TextFieldFirst
    self.textFieldFirst = [[OriginateValidatedTextField alloc] init];
    self.textFieldFirst.frame = CGRectMake(screenWidth*0.55, screenHeight*0.15, 140.0, 30.0);
    self.textFieldFirst.delegate = self;
    self.textFieldFirst.backgroundColor = [UIColor hex:0x007AFF alpha:0.5];
    [self.textFieldFirst setReturnKeyType:UIReturnKeyDone];
    self.textFieldFirst.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldFirst.validationMode = OriginateTextFieldValidationModeLive;
    self.textFieldFirst.validationBlock = ^BOOL(NSString *text) {
        NSString *top = text;
        NSArray *allColors = @[ @"blueColor", @"redColor", @"greenColor", @"blackColor", @"whiteColor", @"orangeColor", @"brownColor", @"purpleColor", @"yellowColor", @"grayColor", @"magentaColor", @"cyanColor", @"lightGrayColor", @"darkGrayColor", @"clearColor"];
        BOOL firstCheck = [allColors containsObject: top];
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
    [self.view addSubview:self.textFieldFirst];
    //TextFieldSecond
    self.textFieldSecond = [[OriginateValidatedTextField alloc] init];
    self.textFieldSecond.frame = CGRectMake(screenWidth*0.55, screenHeight*0.25, 140.0, 30.0);
    self.textFieldSecond.delegate = self;
    self.textFieldSecond.backgroundColor = [UIColor hex:0x007AFF alpha:0.5];
    [self.textFieldSecond setReturnKeyType:UIReturnKeyDone];
    self.textFieldSecond.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldSecond.validationMode = OriginateTextFieldValidationModeLive;
    self.textFieldSecond.validationBlock = ^BOOL(NSString *text) {
        NSString *bottom = text;
        NSArray *allColors = @[ @"blueColor", @"redColor", @"greenColor", @"blackColor", @"whiteColor", @"orangeColor", @"brownColor", @"purpleColor", @"yellowColor", @"grayColor", @"magentaColor", @"cyanColor", @"lightGrayColor", @"darkGrayColor", @"clearColor"];
        BOOL secondCheck = [allColors containsObject: bottom];
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
    [self.view addSubview:self.textFieldSecond];
}

- (void)buttonPressed
{
    CodeViewController *codeView = [[CodeViewController alloc] init];
    codeView.myString = @"UIColor *topColor = [UIColor whiteColor];\n"
    "UIColor *blackColor = [UIColor blackColor];\n"
    "OriginateGradientView *view = [[OriginateGradientView alloc] initWithFirstColor:topColor secondColor:blackColor];\n";
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
