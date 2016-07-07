//
//  MotionViewController.m
//  OriginateUI
//
//  Created by Seth Rainha on 6/22/16.
//  Copyright © 2016 originate.com. All rights reserved.
//

#import "MotionViewController.h"
#import "CodeViewController.h"
@import OriginateUI;

@interface MotionViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) OriginateGradientView *gradientView;

@end

@implementation MotionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Motion Interpolation";
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat screenHeight = CGRectGetHeight(self.view.frame);
    CGFloat screenWidth = CGRectGetWidth(self.view.frame);
    [self.view addSubview:self.label];
    [self.view addSubview:self.gradientView];
    
    UIButton *codeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    codeButton.frame = CGRectMake((screenWidth-110.0),(screenHeight-48.0), 110.0, 40.0);
    [codeButton setTitle:@"Code" forState:UIControlStateNormal];
    [codeButton addTarget:self action:@selector(codeButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:codeButton];
}

- (UILabel *)label
{
    if (!_label){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.1, (screenHeight*0.15), (screenWidth*0.8), (screenHeight*0.4))];
        self.label.text = @"With iOS 7 Apple introduced motion interpolation for views – i.e. you can make your subviews respond to device motion by having the system shift them slightly, thereby creating a parallax-like effect. That said, the API is tedious to use, which is why we extended UIView and introduced a property called motionInterpolationEnabled. It applies a default value and enables x and y axis shifting.";
        self.label.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 15];
        self.label.numberOfLines = 0;
    }
    return _label;
}

- (OriginateGradientView *)gradientView
{
    if (!_gradientView){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.gradientView = [[OriginateGradientView alloc] initWithFrame:CGRectMake(screenWidth*0.25, screenHeight*0.6, screenWidth*0.5, screenWidth*0.5)];
        self.gradientView.firstColor = [UIColor hex:0xFF5E3A];
        self.gradientView.secondColor = [UIColor hex:0xFF2A68];
        self.gradientView.motionInterpolationEnabled = YES;
        self.gradientView.layer.cornerRadius = 8.0;
        self.gradientView.layer.masksToBounds = YES;
    }
    return _gradientView;
}

- (void)codeButtonPressed
{
    CodeViewController *codeView = [[CodeViewController alloc] init];
    codeView.myString = @"UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@\"logo\"]];\n"
    "view.motionInterpolationEnabled = YES;";
    [self.navigationController pushViewController:codeView animated:YES];
}

@end
