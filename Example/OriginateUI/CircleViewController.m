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
}

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat screenHeight = CGRectGetHeight(self.view.frame);
    CGFloat screenWidth = CGRectGetWidth(self.view.frame);
    self.title = NSLocalizedString(@"Circle Images", nil);
    
    UIImageView *imageView =[[UIImageView alloc] initWithFrame:CGRectMake(screenWidth*0.5-50,
                                                                          screenHeight*0.35, 100, 100)];
    CGSize mySize = CGSizeMake(50, 50);
    UIImage *firstImage = [UIImage circularImageWithText:@"S.R" textColor:[UIColor blueColor]
                                         backgroundColor:[UIColor hex:0xFF2D55] size:mySize];
    imageView.image = firstImage;
    [self.view addSubview:imageView];
    [self.view addSubview:self.mainLabel];
    [self.view addSubview:self.secondLabel];
    
    mySize = CGSizeMake(75, 75);
    UIImageView *secondImageView =[[UIImageView alloc] initWithFrame:CGRectMake(screenWidth*0.5-60,
                                                                                screenHeight*0.7, 120, 120)];
    UIImage *secondImage = [UIImage circularImageWithText:@"O.K" textColor:[UIColor hex:0xFFFFFF]
                                          backgroundColor:[UIColor hex:0xC86EDF] size:mySize];
    secondImageView.image = secondImage;
    [self.view addSubview:secondImageView];
    
    UIButton *codeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    codeButton.frame = CGRectMake((self.view.frame.size.width-110),(self.view.frame.size.height-48), 110.0f, 40.0f);
    [codeButton setTitle:NSLocalizedString(@"Code", nil) forState:UIControlStateNormal];
    [codeButton addTarget:self action:@selector(codeButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:codeButton];
}

- (UILabel *)mainLabel
{
    if (!_mainLabel){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.05, (screenHeight*0.1),
                                                                   (screenWidth*0.9), (screenHeight*0.3))];
        self.mainLabel.text = NSLocalizedString(@"Originate UI makes it easy to make circular images with text,"
                                                "for uses such as labels, icons, etc.", nil);
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
        self.secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.05, (screenHeight*0.45),
                                                                     (screenWidth*0.9), (screenHeight*0.3))];
        self.secondLabel.text = NSLocalizedString(@"It is simple and fast to set the radius, the text, and the color"
                                            "of the circle and the text. All it takes is a few lines of code.", nil);
        self.secondLabel.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 20];
        self.secondLabel.numberOfLines = 0;
    }
    return _secondLabel;
}

- (void)codeButton
{
    NSString *codeText = @"   UIImageView *imageView =[[UIImageView alloc] initWithFrame:testRect;"
    "CGSize mySize = CGSizeMake(50, 50);"
    "UIImage *circle = [UIImage circularImageWithText:@\"Example\" textColor:[UIColor hex:0x2B2B2B]"
    "backgroundColor:[UIColor hex:0xFF2D55] size:"
    "mySize];"
    "imageView.image = circle;"
    "[self.view addSubview:imageView];";
    CodeViewController *codeView = [[CodeViewController alloc] initWithText:codeText];
    [self.navigationController pushViewController:codeView animated:YES];
}

@end
