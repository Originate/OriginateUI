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

@end

@implementation CodeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(5, (self.view.frame.size.height*0.25f), (self.view.frame.size.width-10.0f), (self.view.frame.size.height*0.15f))];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.textView.delegate = self;
    [self.textView setBackgroundColor: [UIColor hex:0xfaebd7]];
    self.textView.text = self.myString;
    self.textView.editable = NO;
    [self.view addSubview:_textView];
}



@end
