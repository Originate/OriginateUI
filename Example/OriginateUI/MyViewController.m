//
//  MyThemableViewController.m
//  OriginateUI
//
//  Created by Philip Kluz on 9/22/15.
//  Copyright (c) 2015 originate.com. All rights reserved.
//

//UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//[button addTarget:self
//           action:@selector(aMethod:)
// forControlEvents:UIControlEventTouchUpInside];
//[button setTitle:@"Show View" forState:UIControlStateNormal];
//button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
//[view addSubview:button];

#import "MyViewController.h"
#import "CodeViewController.h"
@interface MyViewController()

#pragma mark - Properties
@property (nonatomic, strong, readwrite) UIView *blueBox;
@property UILabel *label;

@end

@implementation MyViewController

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"Motion Interpolation";
    int screenHeight = self.view.frame.size.height;
    int screenWidth = self.view.frame.size.width;

    self.label = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*.125, (screenHeight*.1), (screenWidth*.75), (screenHeight*.3))];
    self.label.text = @"With iOS 7 Apple introduced motion interpolation for views – i.e. you can make your subviews respond to device motion by having the system shift them slightly, thereby creating a parallax-like effect. That said, the API is tedious to use, which is why we extended UIView and introduced a property called motionInterpolationEnabled. It applies a default value and enables x and y axis shifting.";
    self.label.font = [self.label.font fontWithSize:14];
    self.label.numberOfLines = 0;
    [self.view addSubview:self.label];
    
    //=====

    [self.view addSubview:self.blueBox];
    //Button setup
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake((self.view.frame.size.width-110),(self.view.frame.size.height-48), 110.0f, 40.0f);
    [button setTitle:@"Code" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)buttonPressed {
    CodeViewController *codeView = [[CodeViewController alloc] init];
    codeView.myString = @"UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@\"logo\"]];\n"
    "view.motionInterpolationEnabled = YES;";
    [self.navigationController pushViewController:codeView animated:YES];
    
}



- (NSString *)title
{
    return @"Originate UI";
}

#pragma mark - MyViewController

- (UIView *)blueBox
{
    if (!_blueBox) {
        _blueBox = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*.5-100, self.view.frame.size.height*.5, 200.0, 200.0)];
        _blueBox.backgroundColor = [UIColor blueColor];
        
        // Among other features, OriginateUI allows for quick and convenient enabling of motion interpolation on views, by providing reasonable default values.
        _blueBox.motionInterpolationEnabled = YES;
    }
    
    return _blueBox;
}

@end
