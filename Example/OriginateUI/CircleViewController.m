//
//  CircleViewController.m
//  OriginateUI
//
//  Created by Seth Rainha on 7/7/16.
//  Copyright © 2016 originate.com. All rights reserved.
//

#import "CircleViewController.h"
#import "CodeViewController.h"
@import OriginateUI;

@interface CircleViewController ()

@property (nonatomic, strong) UILabel *mainLabel;
@property (nonatomic, strong) UILabel *secondLabel;

@end

@implementation CircleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    CGFloat screenHeight = CGRectGetHeight(self.view.frame);
    CGFloat screenWidth = CGRectGetWidth(self.view.frame);
    self.title = @"Circle Image";
    
    UIImageView *imageView =[[UIImageView alloc] initWithFrame:CGRectMake(screenWidth*0.5-50,screenHeight*0.35, 100, 100)];
    CGSize mySize = CGSizeMake(50, 50);
    UIImage *firstImage = [UIImage circularImageWithText:@"S.R" textColor:[UIColor blueColor] backgroundColor:[UIColor hex:0xFF2D55] size:mySize];
    imageView.image = firstImage;
    [self.view addSubview:imageView];
    [self.view addSubview:self.mainLabel];
    [self.view addSubview:self.secondLabel];
    
    mySize = CGSizeMake(75, 75);
    UIImageView *secondImageView =[[UIImageView alloc] initWithFrame:CGRectMake(screenWidth*0.5-50,screenHeight*0.65, 120, 120)];
    UIImage *secondImage = [UIImage circularImageWithText:@"O.K" textColor:[UIColor hex:0xFFFFFF] backgroundColor:[UIColor hex:0xC86EDF] size:mySize];
    secondImageView.image = secondImage;
    [self.view addSubview:secondImageView];
    
    UIButton *codeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    codeButton.frame = CGRectMake((self.view.frame.size.width-110),(self.view.frame.size.height-48), 110.0f, 40.0f);
    [codeButton setTitle:@"Code" forState:UIControlStateNormal];
    [codeButton addTarget:self action:@selector(codeButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:codeButton];
}

- (UILabel *)mainLabel
{
    if (!_mainLabel){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.05, (screenHeight*0.1), (screenWidth*0.9), (screenHeight*0.3))];
        self.mainLabel.text = @"Originate UI makes it easy to make circular images with text, for uses such as labels, icons, etc.";
        self.mainLabel.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 20];
        self.mainLabel.numberOfLines = 0;
    }
    return _mainLabel;
}

- (UILabel *)secondLabel
{
    if (!_secondLabel){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.05, (screenHeight*0.425), (screenWidth*0.9), (screenHeight*0.3))];
        self.secondLabel.text = @"It is simple and fast to set the radius, the text, and the color of the circle and the text. All it takes is a few lines of code.";
        self.secondLabel.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 20];
        self.secondLabel.numberOfLines = 0;
    }
    return _secondLabel;
}

- (void)codeButton
{
    CodeViewController *codeView = [[CodeViewController alloc] init];
    codeView.myString = @"   UIImageView *imageView =[[UIImageView alloc] initWithFrame:testRect;"
    "CGSize mySize = CGSizeMake(50, 50);"
    "UIImage *test = [UIImage circularImageWithText:@\"Example\" textColor:[UIColor hex:0x2B2B2B] backgroundColor:[UIColor hex:0xFF2D55] size:"
    "mySize];"
    "imageView.image = test;"
    "[self.view addSubview:imageView];";
    [self.navigationController pushViewController:codeView animated:YES];
}

@end
