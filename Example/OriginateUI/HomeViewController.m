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

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Originate UI", nil);
    CGFloat screenHeight = CGRectGetHeight(self.view.frame);
    CGFloat screenWidth = CGRectGetWidth(self.view.frame);
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.titleImage];
    [self.view addSubview:self.introLabel];
    
    UIButton *featuresButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    featuresButton.frame = CGRectMake((screenWidth*0.5 - 70.0),(screenHeight*0.625), 140.0, 50.0);
    [featuresButton setTitle:NSLocalizedString(@"Features", nil) forState:UIControlStateNormal];
    featuresButton.titleLabel.font = [UIFont systemFontOfSize:26];
    [featuresButton addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:featuresButton];
}

- (UIImageView *) titleImage
{
    if (!_titleImage){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.titleImage =[[UIImageView alloc] initWithFrame:CGRectMake(screenWidth*0.15,screenHeight*0.15,
            screenWidth*0.7,screenWidth*0.2)];
        UIImage *logo = [UIImage imageNamed:@"Originate.png"];
        self.titleImage.image = logo;
    }
    return _titleImage;
}

- (UILabel *)introLabel
{
    if (!_introLabel){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.introLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.025,
            screenHeight*0.4, screenWidth*0.95, screenHeight*0.3)];
        self.introLabel.text = NSLocalizedString(@"\tA collection of classes "
            "and categories making life easier when writing user interface related code.", nil);
        self.introLabel.numberOfLines = 0;
        self.introLabel.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 23];
    }
    return _introLabel;
}

- (void)buttonPressed
{
    TableViewController *tableView = [[TableViewController alloc] init];
    [self.navigationController pushViewController:tableView animated:YES];
}

@end
