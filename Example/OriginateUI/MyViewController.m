//
//  MyThemableViewController.m
//  OriginateUI
//
//  Created by Philip Kluz on 9/22/15.
//  Copyright (c) 2015 originate.com. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController()

#pragma mark - Properties
@property (nonatomic, strong, readwrite) UIView *blueBox;

@end

@implementation MyViewController

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.blueBox];
    self.blueBox.layer.position = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
}

- (NSString *)title
{
    return @"Originate UI";
}

#pragma mark - MyViewController

- (UIView *)blueBox
{
    if (!_blueBox) {
        _blueBox = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 200.0, 200.0)];
        _blueBox.backgroundColor = [UIColor blueColor];
        
        // Among other features, OriginateUI allows for quick and convenient enabling of motion interpolation on views, by providing reasonable default values.
        _blueBox.motionInterpolationEnabled = YES;
    }
    
    return _blueBox;
}

@end
