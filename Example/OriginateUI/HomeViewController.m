//
//  HomeViewController.m
//  OriginateUI
//
//  Created by Seth Rainha on 6/21/16.
//  Copyright © 2016 originate.com. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property (nonatomic, strong) UILabel *introLabel;
@property (nonatomic, strong) UIImageView *titleImage;

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGFloat screenHeight = CGRectGetHeight(self.view.frame);
    CGFloat screenWidth = CGRectGetWidth(self.view.frame);
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.titleImage];
    [self.view addSubview:self.introLabel];
    
    UIButton *featuresButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    featuresButton.frame = CGRectMake((screenWidth-110.0),(screenHeight-48.0), 110.0, 40.0);
    [featuresButton setTitle:@"Features" forState:UIControlStateNormal];
    [featuresButton addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:featuresButton];
}

- (UIImageView *) titleImage
{
    if (!_titleImage){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.titleImage =[[UIImageView alloc] initWithFrame:CGRectMake(screenWidth*0.15,screenHeight*0.15,screenWidth*0.7,screenWidth*0.2)];
        UIImage *logo = [UIImage imageNamed:@"Originate.png"];
        UIImage *whiteLogo = [logo imageTintedWithColor:[UIColor whiteColor]];
        self.titleImage.image = whiteLogo;
    }
    return _titleImage;
}

- (UILabel *)introLabel
{
    if (!_introLabel){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.introLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.025, screenHeight*0.45, screenWidth*0.95, screenHeight*0.3)];
        self.introLabel.text = @"    A collection of classes and categories making life easier when writing user interface related code.";
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


//
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    CGFloat screenHeight = CGRectGetHeight(self.view.frame);
//    CGFloat screenWidth = CGRectGetWidth(self.view.frame);
//    self.view.backgroundColor = [UIColor lightGrayColor];
//    //Title image
//    self.titleImage =[[UIImageView alloc] initWithFrame:CGRectMake(screenWidth*0.15,screenHeight*0.15,screenWidth*0.7,screenWidth*0.2)];
//    UIImage *logo = [UIImage imageNamed:@"Originate.png"];
//    UIImage *whiteLogo = [logo imageTintedWithColor:[UIColor whiteColor]];
//    self.titleImage.image = whiteLogo;
//    [self.view addSubview:self.titleImage];
//    //Intro text
//    self.introLabel;
//    //Features button
//    UIButton *featuresButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    featuresButton.frame = CGRectMake((screenWidth-110.0),(screenHeight-48.0), 110.0, 40.0);
//    [featuresButton setTitle:@"Features" forState:UIControlStateNormal];
//    [featuresButton addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:featuresButton];
//}
//
//- (UILabel *)introLabel
//{
//    if (!_introLabel) {
//        int screenHeight = self.view.frame.size.width;
//        int screenWidth = self.view.frame.size.width;
//        //        int x = 5;
//        self.introLabel = [[UILabel alloc] init];
//        _introLabel.frame = CGRectMake(screenWidth*0.025, screenHeight*0.45, screenWidth*0.95, screenHeight*0.3);
//        _introLabel.text = @"\tA collection of classes and categories making life easier when writing user interface related code.";
//        self.introLabel.numberOfLines = 0;
//        self.introLabel.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 23];
//        [self.view addSubview:self.introLabel];
//    }
//    return _introLabel;
//}
