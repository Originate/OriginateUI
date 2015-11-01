//
//  OriginateLoadingToggleButton.h
//  OriginateUI
//
//  Created by Allen Wu on 10/30/15.
//  Copyright © 2015 Originate. All rights reserved.
//

@import UIKit;

@interface OriginateLoadingToggleButton : UIControl

@property (nonatomic, assign, getter = isOn) BOOL on;

- (instancetype)initWithFrame:(CGRect)frame
                     offImage:(UIImage *)offImage
                      onImage:(UIImage *)onImage
                 spinnerStyle:(UIActivityIndicatorViewStyle)spinnerStyle;

- (void)setLoading;

@end
