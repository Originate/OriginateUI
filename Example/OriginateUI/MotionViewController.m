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

@property UILabel *label;
@property (nonatomic, strong, readwrite) UIView *blueBox;
@property OriginateGradientView *gradientView;

@end

@implementation MotionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Motion Interpolation";
    self.view.backgroundColor = [UIColor lightGrayColor];
    int screenHeight = self.view.frame.size.height;
    int screenWidth = self.view.frame.size.width;
    //Text label
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.1, (screenHeight*0.15), (screenWidth*0.8), (screenHeight*0.4))];
    self.label.text = @"With iOS 7 Apple introduced motion interpolation for views – i.e. you can make your subviews respond to device motion by having the system shift them slightly, thereby creating a parallax-like effect. That said, the API is tedious to use, which is why we extended UIView and introduced a property called motionInterpolationEnabled. It applies a default value and enables x and y axis shifting.";
    self.label.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 15];
    self.label.numberOfLines = 0;
    [self.view addSubview:self.label];
    //Gradient View
    self.gradientView = [[OriginateGradientView alloc] initWithFrame:CGRectMake(screenWidth*0.25, screenHeight*0.6, screenWidth*0.5, screenWidth*0.5)];
    self.gradientView.firstColor = [UIColor hex:0xFF5E3A];
    self.gradientView.secondColor = [UIColor hex:0xFF2A68];
    self.gradientView.motionInterpolationEnabled = YES;
    self.gradientView.layer.cornerRadius = 8.0;
    self.gradientView.layer.masksToBounds = YES;
    [self.view addSubview:self.gradientView];
    //Code button setup
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake((screenWidth-110.0),(screenHeight-48.0), 110.0, 40.0);
    [button setTitle:@"Code" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonPressed
{
    CodeViewController *codeView = [[CodeViewController alloc] init];
    codeView.myString = @"UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@\"logo\"]];\n"
    "view.motionInterpolationEnabled = YES;";
    [self.navigationController pushViewController:codeView animated:YES];
}

@end
