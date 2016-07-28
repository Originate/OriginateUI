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
}

- (void)loadView
{
    [super loadView];
    [self.view addSubview:self.textView];
}

- (UITextView *)textView
{
    if (!_textView) {
        self.textView = [[UITextView alloc] initWithFrame:CGRectMake(5, (self.view.frame.size.height*0.25),
                        (self.view.frame.size.width-10.0), (self.view.frame.size.height*0.3))];
        self.view.backgroundColor = [UIColor whiteColor];
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.textView.delegate = self;
        [self.textView setBackgroundColor: [UIColor hex:0xfaebd7]];
        self.textView.text = self.codeText;
        self.textView.editable = NO;
    }
    return _textView;
}


- (instancetype)initWithText:(NSString *)text
{
    self = [super init];
    if (self) {
        _codeText = text;
    }
    return self;
}

@end
