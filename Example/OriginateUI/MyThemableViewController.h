//
//  MyThemableViewController.h
//  OriginateUI
//
//  Created by Philip Kluz on 9/22/15.
//  Copyright (c) 2015 originate.com. All rights reserved.
//

@import UIKit;
@import OriginateUI;

@class MyTheme;

@interface MyThemableViewController : UIViewController

#pragma mark - Methods
- (instancetype)initWithTheme:(MyTheme *)theme;

@end
