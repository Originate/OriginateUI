//
//  InstallationViewController.m
//  OriginateUI
//
//  Created by Seth Rainha on 6/22/16.
//  Copyright © 2016 originate.com. All rights reserved.
//

#import "InstallationViewController.h"
#import "CodeViewController.h"
@import OriginateUI;

@interface InstallationViewController ()

@property (nonatomic, strong) UILabel *instLabel;
@property (nonatomic, strong) UILabel *reqLabel;
@property (nonatomic, strong) UILabel *useLabel;
@property (nonatomic, strong) UILabel *instLabel2;
@property (nonatomic, strong) UILabel *reqLabel2;
@property (nonatomic, strong) UILabel *useLabel2;
@property (nonatomic, strong) UILabel *endLabel;
@property (nonatomic, strong) UITextView *textViewFirst;
@property (nonatomic, strong) UITextView *textViewSecond;

@end

@implementation InstallationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Installation";
    [self.view addSubview:self.instLabel];
    [self.view addSubview:self.reqLabel];
    [self.view addSubview:self.useLabel];
    [self.view addSubview:self.instLabel2];
    [self.view addSubview:self.reqLabel2];
    [self.view addSubview:self.useLabel2];
    [self.view addSubview:self.endLabel];
    [self.view addSubview:self.textViewFirst];
    [self.view addSubview:self.textViewSecond];
}

- (UILabel *)instLabel
{
    if (!_instLabel){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.instLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, screenHeight*0.2, screenWidth*0.8, 50.0)];
        self.instLabel.text = @"Install with CocoaPods";
        self.instLabel.font = [UIFont fontWithName:@"CircularPro-Medium" size:22];
        self.instLabel.numberOfLines = 0;
    }
    return _instLabel;
}

- (UILabel *)reqLabel
{
    if (!_reqLabel){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.reqLabel = [[UILabel alloc] initWithFrame:CGRectMake(10., screenHeight*0.45, screenWidth*0.8, 50.0)];
        self.reqLabel.text = @"Requirements";
        self.reqLabel.font = [UIFont fontWithName:@"CircularPro-Medium" size:22];
        self.reqLabel.numberOfLines = 0;
    }
    return _reqLabel;
}

- (UILabel *)useLabel
{
    if (!_useLabel){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.useLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, screenHeight*0.6, screenWidth*0.8, 50.0)];
        self.useLabel.text = @"Usage: Import the Framework";
        self.useLabel.font = [UIFont fontWithName:@"CircularPro-Medium" size:22];
        self.useLabel.numberOfLines = 0;
    }
    return _useLabel;
}

- (UILabel *)instLabel2
{
    if (!_instLabel2){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.instLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(20.0, screenHeight*0.25, screenWidth*0.8, 50.0)];
        self.instLabel2.text = @"Add the following lines to your Podfile and run pod install.";
        self.instLabel2.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 14];
        self.instLabel2.numberOfLines = 0;
    }
    return _instLabel2;
}

- (UILabel *)reqLabel2
{
    if (!_reqLabel2){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.reqLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(20.0, screenHeight*0.5, screenWidth*0.8, 50.0)];
        self.reqLabel2.text = @"iOS 8.0+";
        self.reqLabel2.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 14];
        self.reqLabel2.numberOfLines = 0;
    }
    return _reqLabel2;
}

- (UILabel *)useLabel2
{
    if (!_useLabel2){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.useLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(20.0, screenHeight*0.65, screenWidth*0.8, 50.0)];
        self.useLabel2.text = @"Add the following line wherever you want to access the framework:";
        self.useLabel2.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 14];
        self.useLabel2.numberOfLines = 0;
    }
    return _useLabel2;
}

- (UILabel *)endLabel
{
    if (!_endLabel){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.endLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, screenHeight*0.825, screenWidth*0.8, 85.0)];
        self.endLabel.text = @"You now have access to a wide range of categories and classes that simplify everyday life when writing user interface related code.";
        self.endLabel.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 14];
        self.endLabel.numberOfLines = 0;
    }
    return _endLabel;
}

- (UITextView *)textViewFirst
{
    if (!_textViewFirst){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.textViewFirst = [[UITextView alloc] initWithFrame:CGRectMake(40.0, (screenHeight*0.35), (screenWidth-80.0), (screenHeight*0.075))];
        self.automaticallyAdjustsScrollViewInsets = NO;
        [self.textViewFirst setReturnKeyType:UIReturnKeyDone];
        [self.textViewFirst setBackgroundColor: [UIColor hex:0xfaebd7]];
        self.textViewFirst.delegate = self;
        self.textViewFirst.text = @"source 'https://github.com/Originate/CocoaPods.git'"
        "pod 'OriginateUI'";
    }
    return _textViewFirst;
}

- (UITextView *)textViewSecond
{
    if (!_textViewSecond){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.textViewSecond = [[UITextView alloc] initWithFrame:CGRectMake(40, (screenHeight*.75), (screenWidth-80.0), (screenHeight*0.075))];
        [self.textViewSecond setReturnKeyType:UIReturnKeyDone];
        [self.textViewSecond setBackgroundColor: [UIColor hex:0xfaebd7]];
        self.textViewSecond.delegate = self;
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.textViewSecond.text = @"@import OriginateUI;";
    }
    return _textViewSecond;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (range.length==0) {
        if ([text isEqualToString:@"\n"]) {
            [textView resignFirstResponder];
            return NO;
        }
    }
    return YES;
}

@end
