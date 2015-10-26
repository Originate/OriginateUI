//
//  UITableViewCell+Separators.m
//  OriginateUI
//
//  Created by Allen Wu on 10/25/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "UITableViewCell+Separators.h"

@implementation UITableViewCell (Separators)

- (void)setSeparatorsToFullWidth
{
    // http://stackoverflow.com/a/25877725/3418047
    
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        [self setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [self setPreservesSuperviewLayoutMargins:NO];
    }
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsZero];
    }
}

@end
