//
//  HomeViewController.m
//  OriginateUI
//
//  Created by Seth Rainha on 6/21/16.
//  Copyright © 2016 originate.com. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property UILabel *label;
@property UIImageView *imageView;

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    int screenHeight = self.view.frame.size.height;
    int screenWidth = self.view.frame.size.width;
    self.view.backgroundColor = [UIColor lightGrayColor];
    //Title image
    self.imageView =[[UIImageView alloc] initWithFrame:CGRectMake(screenWidth*0.15,screenHeight*0.15,screenWidth*0.7,screenWidth*0.2)];
    UIImage *logo = [UIImage imageNamed:@"Originate.png"];
    UIImage *whiteLogo = [logo imageTintedWithColor:[UIColor whiteColor]];
    self.imageView.image = whiteLogo;
    [self.view addSubview:self.imageView];
    //Intro text label
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.025, screenHeight*0.45, screenWidth*0.95, screenHeight*0.3)];
    self.label.text = @"    A collection of classes and categories making life easier when writing user interface related code.";
    self.label.font = [self.label.font fontWithSize:25];
    self.label.numberOfLines = 0;
    self.label.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 23];
    [self.view addSubview:self.label];
    //Features button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake((screenWidth-110.0),(screenHeight-48.0), 110.0, 40.0);
    [button setTitle:@"Features" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonPressed
{
    TableViewController *tableView = [[TableViewController alloc] init];
    [self.navigationController pushViewController:tableView animated:YES];
}

@end
