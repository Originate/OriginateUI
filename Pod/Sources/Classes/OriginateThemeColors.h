//
//  OriginateThemeColors.h
//  OriginateUI
//
//  Created by Philip Kluz on 7/6/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

@import UIKit;

#import "UIColor+OriginateHex.h"

@interface OriginateThemeColors : NSObject

#pragma mark - Properties
@property (nonatomic, strong, readwrite) UIColor *primaryColor;
@property (nonatomic, strong, readwrite) UIColor *secondaryColor;
@property (nonatomic, strong, readwrite) UIColor *secondaryComplementColor;
@property (nonatomic, strong, readwrite) UIColor *primaryAccentColor;
@property (nonatomic, strong, readwrite) UIColor *primaryAccentComplementColor;
@property (nonatomic, strong, readwrite) UIColor *secondaryAccentColor;
@property (nonatomic, strong, readwrite) UIColor *successColor;
@property (nonatomic, strong, readwrite) UIColor *failureColor;


#pragma mark - Methods
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
