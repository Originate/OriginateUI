//
//  OriginateThemeFonts.h
//  PeerStars
//
//  Created by Philip Kluz on 7/6/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

@import UIKit;

@interface OriginateThemeFonts : NSObject

#pragma mark - Properties
@property (nonatomic, strong, readwrite) UIFont *defaultFont;
@property (nonatomic, strong, readwrite) UIFont *defaultBoldFont;
@property (nonatomic, strong, readwrite) UIFont *defaultItalicFont;
@property (nonatomic, strong, readwrite) UIFont *defaultSmallFont;

#pragma mark - Methods
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
