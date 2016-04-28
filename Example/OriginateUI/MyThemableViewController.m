//
//  MyThemableViewController.m
//  OriginateUI
//
//  Created by Philip Kluz on 9/22/15.
//  Copyright (c) 2015 originate.com. All rights reserved.
//

#import "MyThemableViewController.h"
#import "MyTheme.h"
#import "MyKeyboardViewController.h"

@interface MyThemableViewController ()

#pragma mark - Properties
@property (nonatomic, strong, readwrite) MyTheme *theme;

@end

@implementation MyThemableViewController

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = self.theme.rootViewBackgroundColor;
  
  UITapGestureRecognizer* tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedView)];
  [self.view addGestureRecognizer:tapGestureRecognizer];
}

- (NSString *)title
{
    return @"Themed View Controller";
}

#pragma mark - MyThemableViewController

- (instancetype)initWithTheme:(MyTheme *)theme
{
    self = [super init];
    
    if (self) {
        _theme = theme;
    }
    
    return self;
}

#pragma mark - Gesture Recognizer

- (void)tappedView {
  MyKeyboardViewController* nextViewController = [[MyKeyboardViewController alloc] init];
  [self.navigationController pushViewController:nextViewController animated:YES];
}

@end
