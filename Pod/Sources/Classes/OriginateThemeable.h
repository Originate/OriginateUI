//
//  OriginateThemeable.h
//  OriginateUI
//
//  Created by Allen Wu on 7/21/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

@import Foundation;

@class OriginateTheme;

@protocol OriginateThemeable <NSObject>

- (void)setTheme:(OriginateTheme *)theme;

@end
