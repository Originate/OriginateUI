//
//  LiscenseViewController.m
//  OriginateUI
//
//  Created by Seth Rainha on 6/22/16.
//  Copyright © 2016 originate.com. All rights reserved.
//

#import "LiscenseViewController.h"
#import "CodeViewController.h"

@interface LiscenseViewController ()

@property (nonatomic, strong) NSString *myString;
@property (nonatomic, strong) UILabel *label;

@end

@implementation LiscenseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Liscense";
    [self setString];
    [self.view addSubview:self.label];
}

- (UILabel *)label
{
    if (!_label){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.125, (screenHeight*0.125),
                                                               (screenWidth*0.75), (screenHeight*0.875))];
        self.label.text = self.myString;
        self.label.font = [self.label.font fontWithSize:12];
        self.label.numberOfLines = 0;
    }
    return _label;
}

-(void)setString
{
    self.myString = @"Copyright (c) 2015 Originate\n\n"
    "Permission is hereby granted, free of charge, to any person obtaining a copy"
    "of this software and associated documentation files (the \"Software\"), to deal"
    "in the Software without restriction, including without limitation the rights"
   " to use, copy, modify, merge, publish, distribute, sublicense, and/or sell"
    "copies of the Software, and to permit persons to whom the Software is"
    "furnished to do so, subject to the following conditions:\n\n"
       " The above copyright notice and this permission notice shall be included in"
        "all copies or substantial portions of the Software.\n\n "
        "THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR"
        "IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,"
       " FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE"
        "AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER"
        "LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,"
        "OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN"
       " THE SOFTWARE.";
}

@end