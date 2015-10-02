//
//  UIViewController+OriginateTabBabScroller.h
//  OriginateUI
//
//  Created by William Tachau on 10/1/15.
//  Copyright © 2015 Originate. All rights reserved.
//

@import UIKit;

@interface UIViewController (FACTabBarSlider)

@property (nonatomic, readwrite) CGFloat previousScrollViewOffset;

- (void)slideTabBar:(UITabBar *)tabBar inResponseToScrollInScrollView:(UIScrollView *)scrollView;

@end
