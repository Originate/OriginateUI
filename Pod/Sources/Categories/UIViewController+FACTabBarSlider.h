//
//  UIViewController+FACTabBarSlider.h
//  Factiva
//
//  Created by William Tachau on 10/1/15.
//  Copyright © 2015 Originate. All rights reserved.
//

@import UIKit;

@interface UIViewController (FACTabBarSlider)

@property (nonatomic, readwrite) CGFloat previousScrollViewOffset;

- (void)slideTabBarIfNeeded:(UIScrollView *)scrollView;

@end
