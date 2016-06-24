//
//  CodeViewController.m
//  OriginateUI
//
//  Created by Seth Rainha on 6/22/16.
//  Copyright © 2016 originate.com. All rights reserved.
//

#import "CodeViewController.h"

@interface CodeViewController ()

@end

@implementation CodeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(5, (self.view.frame.size.height*0.25f), (self.view.frame.size.width-10.0f), (self.view.frame.size.height*0.15f))];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.textView.delegate = self;
    [self.textView setReturnKeyType:UIReturnKeyDone];
    self.textView.text = self.myString;
    [self.view addSubview:_textView];
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
