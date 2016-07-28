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

@interface InstallationViewController () <UITextViewDelegate>

@property (nonatomic, strong) UILabel *instLabel;
@property (nonatomic, strong) UILabel *reqLabel;
@property (nonatomic, strong) UILabel *useLabel;
@property (nonatomic, strong) UILabel *instSubLabel;
@property (nonatomic, strong) UILabel *reqSubLabel;
@property (nonatomic, strong) UILabel *useSubLabel;
@property (nonatomic, strong) UILabel *endLabel;
@property (nonatomic, strong) UITextView *textViewFirst;
@property (nonatomic, strong) UITextView *textViewSecond;

@end

@implementation InstallationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = NSLocalizedString(@"Installation", nil);
    [self.view addSubview:self.instLabel];
    [self.view addSubview:self.reqLabel];
    [self.view addSubview:self.useLabel];
    [self.view addSubview:self.instSubLabel];
    [self.view addSubview:self.reqSubLabel];
    [self.view addSubview:self.useSubLabel];
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
        self.instLabel.text = NSLocalizedString(@"Install with CocoaPods", nil);
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
        self.reqLabel.text = NSLocalizedString(@"Requirements", nil);
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
        self.useLabel.text = NSLocalizedString(@"Usage: Import the Framework", nil);
        self.useLabel.font = [UIFont fontWithName:@"CircularPro-Medium" size:22];
        self.useLabel.numberOfLines = 0;
    }
    return _useLabel;
}

- (UILabel *)instSubLabel
{
    if (!_instSubLabel){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.instSubLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, screenHeight*0.25, screenWidth*0.8, 50.0)];
        self.instSubLabel.text = NSLocalizedString(@"Add the following lines to your Podfile and run pod install.", nil);
        self.instSubLabel.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 14];
        self.instSubLabel.numberOfLines = 0;
    }
    return _instSubLabel;
}

- (UILabel *)reqSubLabel
{
    if (!_reqSubLabel){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.reqSubLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, screenHeight*0.5, screenWidth*0.8, 50.0)];
        self.reqSubLabel.text = NSLocalizedString(@"iOS 8.0+", nil);
        self.reqSubLabel.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 14];
        self.reqSubLabel.numberOfLines = 0;
    }
    return _reqSubLabel;
}

- (UILabel *)useSubLabel
{
    if (!_useSubLabel){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.useSubLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, screenHeight*0.65, screenWidth*0.8, 50.0)];
        self.useSubLabel.text = NSLocalizedString(@"Add the following line wherever you want"
                                                "to access the framework:", nil);
        self.useSubLabel.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 14];
        self.useSubLabel.numberOfLines = 0;
    }
    return _useSubLabel;
}

- (UILabel *)endLabel
{
    if (!_endLabel){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.endLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, screenHeight*0.825, screenWidth*0.8, 85.0)];
        self.endLabel.text = NSLocalizedString(@"You now have access to a wide range of categories and classes that"
                                               "simplify everyday life when writing user interface related code.", nil);
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
        self.textViewFirst = [[UITextView alloc] initWithFrame:CGRectMake(40.0, (screenHeight*0.35),
                                                                          (screenWidth-80.0), (screenHeight*0.075))];
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.textViewFirst.editable = NO;
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
        self.textViewSecond = [[UITextView alloc] initWithFrame:CGRectMake(40, (screenHeight*.75),
                                                                           (screenWidth-80.0), (screenHeight*0.075))];
        self.textViewSecond.editable = NO;
        [self.textViewSecond setBackgroundColor: [UIColor hex:0xfaebd7]];
        self.textViewSecond.delegate = self;
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.textViewSecond.text = @"@import OriginateUI;";
    }
    return _textViewSecond;
}

@end
