//
//  ToggleButtonViewController.m
//  OriginateUI
//
//  Created by Seth Rainha on 16/8/12.
//  Copyright © 2016 originate.com. All rights reserved.
//

#import "ToggleButtonViewController.h"

@interface ToggleButtonViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation ToggleButtonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Loading Toggle Button", nil);
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)loadView
{
    [super loadView];
    [self.view addSubview:self.label];
    
    [self.label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.label
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:80]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.label
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.label
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.5
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.label
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.5
                                                           constant:0]];
}

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.text = NSLocalizedString(@"Coming soon.", nil);
        _label.numberOfLines = 0;
        _label.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 23];
    }
    return _label;
}



@end
