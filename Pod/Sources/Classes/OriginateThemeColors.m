//
//  OriginateThemeColors.m
//  OriginateUI
//
//  Created by Philip Kluz on 7/6/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "OriginateThemeColors.h"

NSString * const OUIColorPrimaryKey = @"primary";
NSString * const OUIColorSecondaryKey = @"secondary";
NSString * const OUIColorSecondaryComplementKey = @"secondaryComplement";
NSString * const OUIColorPrimaryAccentKey = @"primaryAccent";
NSString * const OUIColorPrimaryAccentComplementKey = @"primaryAccentComplement";
NSString * const OUIColorSecondaryAccentKey = @"secondaryAccent";
NSString * const OUIColorSuccessKey = @"success";
NSString * const OUIColorFailureKey = @"failure";


@interface OriginateThemeColors ()

#pragma mark - Properties
@property (nonatomic, strong, readwrite) NSDictionary *definition;

@end

@implementation OriginateThemeColors

#pragma mark - OriginateThemeColors

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self) {
        _definition = dictionary;
    }
    
    return self;
}

- (UIColor *)primaryColor
{
    if (!_primaryColor) {
        _primaryColor = [[self class] colorForKey:OUIColorPrimaryKey
                                           source:self.definition
                                         fallback:[UIColor lightGrayColor]];
    }
    
    return _primaryColor;
}

- (UIColor *)secondaryColor
{
    if (!_secondaryColor) {
        _secondaryColor = [[self class] colorForKey:OUIColorSecondaryKey
                                             source:self.definition
                                           fallback:[UIColor darkGrayColor]];
    }
    
    return _secondaryColor;
}

- (UIColor *)secondaryComplementColor
{
    if (!_secondaryComplementColor) {
        _secondaryComplementColor = [[self class] colorForKey:OUIColorSecondaryComplementKey
                                                       source:self.definition
                                                     fallback:[UIColor lightGrayColor]];
    }
    
    return _secondaryComplementColor;
}

- (UIColor *)primaryAccentColor
{
    if (!_primaryAccentColor) {
        _primaryAccentColor = [[self class] colorForKey:OUIColorPrimaryAccentKey
                                                 source:self.definition
                                               fallback:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0]];
    }
    
    return _primaryAccentColor;
}

- (UIColor *)primaryAccentComplementColor
{
    if (!_primaryAccentComplementColor) {
        _primaryAccentComplementColor = [[self class] colorForKey:OUIColorPrimaryAccentComplementKey
                                                           source:self.definition
                                                         fallback:[UIColor whiteColor]];
    }
    
    return _primaryAccentComplementColor;
}

- (UIColor *)secondaryAccentColor
{
    if (!_secondaryAccentColor) {
        _secondaryAccentColor = [[self class] colorForKey:OUIColorSecondaryAccentKey
                                                   source:self.definition
                                                 fallback:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0]];
    }
    
    return _secondaryAccentColor;
}

- (UIColor *)successColor
{
    if (!_successColor) {
        _successColor = [[self class] colorForKey:OUIColorSuccessKey
                                           source:self.definition
                                         fallback:[UIColor greenColor]];
    }
    
    return _successColor;
}

- (UIColor *)failureColor
{
    if (!_failureColor) {
        _failureColor = [[self class] colorForKey:OUIColorFailureKey
                                           source:self.definition
                                         fallback:[UIColor redColor]];
    }
    
    return _failureColor;
}

+ (UIColor *)colorForKey:(NSString *)key
                  source:(NSDictionary *)definition
                fallback:(UIColor *)fallback
{
    NSString *colorValue = definition[key];
    
    if ([colorValue length] == 0) {
        return fallback;
    }
    
    UIColor *color = [UIColor colorWithHexString:colorValue];
    
    return color ?: fallback;
}

@end
