//
//  InspectableViewController.m
//  OriginateUI
//
//  Created by Seth Rainha on 6/30/16.
//  Copyright © 2016 originate.com. All rights reserved.
//

#import "InspectableViewController.h"

@interface InspectableViewController ()

@property (nonatomic, strong) UILabel *mainLabel;

@end

@implementation InspectableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.mainLabel];
}

- (UILabel *)mainLabel
{
    if (!_mainLabel){
        CGFloat screenHeight = CGRectGetHeight(self.view.frame);
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        self.mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.15, (screenHeight*0.15), (screenWidth*0.9), (screenHeight*0.3))];
        self.mainLabel.text = @"Open this xib in xcode and go to the attribute inspector. The IBInspectable properties are the first and second gradient colors.";
        self.mainLabel.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 20];
        self.mainLabel.numberOfLines = 0;
    }
    return _mainLabel;
}

@end
