//
//  OriginateThemeFonts.m
//  OriginateUI
//
//  Created by Philip Kluz on 7/6/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "OriginateThemeFonts.h"

NSString * const OUIFontsDefaultKey = @"default";
NSString * const OUIFontsDefaultBoldKey = @"defaultBold";
NSString * const OUIFontsDefaultItalicKey = @"defaultItalic";
NSString * const OUIFontsDefaultSmallKey = @"defaultSmall";
NSString * const OUIFontsNavigationBarTitleKey = @"navigationBarTitle";
NSString * const OUIFontsTableCellTitleKey = @"tableCellTitle";
NSString * const OUIFontsTableSectionTitleKey = @"tableSectionTitle";

NSString * const OUIFontNameKey = @"name";
NSString * const OUIFontSizeKey = @"size";

@interface OriginateThemeFonts ()

#pragma mark - Properties
@property (nonatomic, strong, readwrite) NSDictionary *definition;

@end

@implementation OriginateThemeFonts

#pragma mark - OriginateThemeFonts

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self) {
        _definition = dictionary;
    }
    
    return self;
}

- (UIFont *)defaultFont
{
    if (!_defaultFont) {
        _defaultFont = [[self class] fontForKey:OUIFontsDefaultKey
                                         source:self.definition
                                       fallback:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
    }
    
    return _defaultFont;
}

- (UIFont *)defaultBoldFont
{
    if (!_defaultBoldFont) {
        _defaultBoldFont = [[self class] fontForKey:OUIFontsDefaultBoldKey
                                             source:self.definition
                                           fallback:[UIFont boldSystemFontOfSize:[UIFont systemFontSize]]];
    }
    
    return _defaultBoldFont;
}

- (UIFont *)defaultItalicFont
{
    if (!_defaultItalicFont) {
        _defaultItalicFont = [[self class] fontForKey:OUIFontsDefaultItalicKey
                                               source:self.definition
                                             fallback:[UIFont italicSystemFontOfSize:[UIFont systemFontSize]]];
    }
    
    return _defaultItalicFont;
}

- (UIFont *)defaultSmallFont
{
    if (!_defaultSmallFont) {
        _defaultSmallFont = [[self class] fontForKey:OUIFontsDefaultSmallKey
                                              source:self.definition
                                            fallback:[UIFont systemFontOfSize:[UIFont smallSystemFontSize]]];
    }
    
    return _defaultSmallFont;
}

- (UIFont *)navigationBarTitleFont
{
    if (!_navigationBarTitleFont) {
        _navigationBarTitleFont = [[self class] fontForKey:OUIFontsNavigationBarTitleKey
                                                    source:self.definition
                                                  fallback:[UIFont boldSystemFontOfSize:ceilf([UIFont systemFontSize] * 1.5)]];
    }
    
    return _navigationBarTitleFont;
}

- (UIFont *)tableCellTitleFont
{
    if (!_tableCellTitleFont) {
        _tableCellTitleFont = [[self class] fontForKey:OUIFontsTableCellTitleKey
                                                source:self.definition
                                              fallback:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
    }
    
    return _tableCellTitleFont;
}

- (UIFont *)tableSectionTitleFont
{
    if (!_tableSectionTitleFont) {
        _tableSectionTitleFont = [[self class] fontForKey:OUIFontsTableSectionTitleKey
                                                   source:self.definition
                                                 fallback:[UIFont boldSystemFontOfSize:[UIFont systemFontSize]]];
    }
    
    return _tableSectionTitleFont;
}

+ (UIFont *)fontForKey:(NSString *)key
                source:(NSDictionary *)definition
              fallback:(UIFont *)fallback
{
    NSString *name = definition[key][OUIFontNameKey];
    CGFloat size = [definition[key][OUIFontSizeKey] doubleValue];
    
    if (size == 0.0) {
        size = [UIFont systemFontSize];
    }
    
    if (!name && fallback) {
        return fallback;
    } else if (!name) {
        return [UIFont systemFontOfSize:size];
    }
    
    return [UIFont fontWithName:name size:size];
}

@end
