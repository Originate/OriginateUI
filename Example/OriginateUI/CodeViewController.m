//
//  CodeViewController.m
//  OriginateUI
//
//  Created by Seth Rainha on 6/22/16.
//  Copyright © 2016 originate.com. All rights reserved.
//

#import "CodeViewController.h"
@import OriginateUI;

@interface CodeViewController () <UITextViewDelegate>

@property (nonatomic, strong) NSString *codeText;
@property (nonatomic, strong) UITextView *textView;

@end

@implementation CodeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)loadView
{
    [super loadView];
    [self.view addSubview:self.textView];
    
    [self.textView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:100]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:-10]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:0.4
                                                           constant:0]];
}

- (UITextView *)textView
{
    if (!_textView) {
        _textView = [[UITextView alloc] init];
        _textView.delegate = self;
        [_textView setBackgroundColor: [UIColor hex:0xfaebd7]];
        _textView.text = self.codeText;
        _textView.editable = NO;
    }
    return _textView;
}


- (instancetype)initWithText:(NSString *)text
{
    self = [super init];
    if (self) {
        self.codeText = text;
    }
    return self;
}

@end
