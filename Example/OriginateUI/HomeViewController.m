//
//  HomeViewController.m
//  OriginateUI
//
//  Created by Seth Rainha on 6/21/16.
//  Copyright © 2016 originate.com. All rights reserved.
//

#import "HomeViewController.h"
#import "TableViewController.h"
@import OriginateUI;

@interface HomeViewController ()

@property (nonatomic, strong) UILabel *introLabel;
@property (nonatomic, strong) UIImageView *titleImage;
@property (nonatomic, strong) UIButton *featuresButton;

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Originate UI", nil);
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)loadView
{
    [super loadView];
    [self.view addSubview:self.titleImage];
    [self.view addSubview:self.introLabel];
    [self.view addSubview:self.featuresButton];
    
    [self.titleImage setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.titleImage
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:100]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.titleImage
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.titleImage
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.8
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.titleImage
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:(0.8 * (1.0/3.56))
                                                           constant:0]];
    
    [self.introLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.introLabel
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.titleImage
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:50]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.introLabel
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:0.2
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.introLabel
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.introLabel
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.95
                                                           constant:0]];
    
    [self.featuresButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.featuresButton
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.introLabel
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:20]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.featuresButton
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:0.0
                                                           constant:50]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.featuresButton
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.featuresButton
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.6
                                                           constant:0]];
}

- (UIButton *) featuresButton
{
    if (!_featuresButton) {
        _featuresButton = [[UIButton alloc] init];
        _featuresButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_featuresButton setTitle:NSLocalizedString(@"Features", nil) forState:UIControlStateNormal];
        _featuresButton.titleLabel.font = [UIFont systemFontOfSize:26];
        [_featuresButton addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    }
    return _featuresButton;
}

- (UIImageView *) titleImage
{
    if (!_titleImage) {
        _titleImage = [[UIImageView alloc] init];
        _titleImage.image = [UIImage imageNamed:@"Originate.png"];
    }
    return _titleImage;
}

- (UILabel *)introLabel
{
    if (!_introLabel) {
        _introLabel = [[UILabel alloc] init];
        _introLabel.text = NSLocalizedString(@"\tA collection of classes "
            "and categories making life easier when writing user interface related code.", nil);
        _introLabel.numberOfLines = 0;
        _introLabel.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 23];
    }
    return _introLabel;
}

- (void)buttonPressed
{
    TableViewController *tableView = [[TableViewController alloc] init];
    [self.navigationController pushViewController:tableView animated:YES];
}

@end
