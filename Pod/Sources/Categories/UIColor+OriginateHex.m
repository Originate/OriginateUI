//
//  UIImage+OriginateHex.m
//  OriginateUI
//
//  Created by Philip Kluz on 6/17/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "UIColor+OriginateHex.h"

@implementation UIColor (OriginateHex)

+ (instancetype)colorWithHexString:(NSString *)hexString
{
    // Determine if the first two characters are "0x" which we can then ignore
    if ([hexString length] < 2) {
      return nil;
    }
  
    NSString* firstTwoChars = [hexString substringToIndex:2];
    NSString* hexDigitsString = hexString;
    if ([firstTwoChars isEqualToString:@"0x"]) {
      hexDigitsString = [hexString substringFromIndex:2];
    }
  
    int length = [hexDigitsString length];
    if (length != 6 && length != 8) {
        return nil;
    }
    
    NSRegularExpression *redEx = [NSRegularExpression regularExpressionWithPattern:@"[^0-9|a-fA-F]"
                                                                           options:0
                                                                             error:NULL];
    NSUInteger match = [redEx numberOfMatchesInString:hexDigitsString
                                              options:NSMatchingReportCompletion
                                                range:NSMakeRange(0, length)];
    
    if (match != 0) {
        return nil;
    }

    NSRange alphaRange = NSMakeRange(0,0);
    NSRange redRange;
    NSRange greenRange;
    NSRange blueRange;

    if (length == 6) {
      redRange = NSMakeRange(0, 2);
      greenRange = NSMakeRange(2, 2);
      blueRange = NSMakeRange(4, 2);
    } else {
      // Length is 8, so ARGB format
      alphaRange = NSMakeRange(0, 2);
      redRange = NSMakeRange(2, 2);
      greenRange = NSMakeRange(4, 2);
      blueRange = NSMakeRange(6, 2);
    }
  
    NSString *alphaString = alphaRange.length != 0 ? [hexDigitsString substringWithRange:alphaRange] : nil;
    NSString *redString = [hexDigitsString substringWithRange:redRange];
    NSString *greenString = [hexDigitsString substringWithRange:greenRange];
    NSString *blueString = [hexDigitsString substringWithRange:blueRange];
  
    NSScanner *alphaScanner = alphaString ? [NSScanner scannerWithString:alphaString] : nil;
    NSScanner *redScanner = [NSScanner scannerWithString:redString];
    NSScanner *greenScanner = [NSScanner scannerWithString:greenString];
    NSScanner *blueScanner = [NSScanner scannerWithString:blueString];
  
    u_int alphaValue = 0;
    u_int redValue = 0;
    u_int greenValue = 0;
    u_int blueValue = 0;
  
    if (alphaScanner) {
      [alphaScanner scanHexInt:&alphaValue];
    }
    [redScanner scanHexInt:&redValue];
    [greenScanner scanHexInt:&greenValue];
    [blueScanner scanHexInt:&blueValue];
  
    CGFloat alpha = alphaScanner ? (CGFloat)alphaValue / 254.0 : 1.0;
    CGFloat red = (CGFloat)redValue / 254.0;
    CGFloat green = (CGFloat)greenValue / 254.0;
    CGFloat blue = (CGFloat)blueValue / 254.0;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (NSString *)hexStringWithColor:(UIColor *)color
{
    if (!color) {
        return nil;
    }
    
    if (color == [UIColor whiteColor]) {
        return @"FFFFFF";
    }
    
    CGFloat red;
    CGFloat blue;
    CGFloat green;
    CGFloat alpha;
    
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    
    CGFloat red255 = red * 255.0;
    CGFloat green255 = green * 255.0;
    CGFloat blue255 = blue * 255.0;
    
    NSString *returnString = [NSString stringWithFormat:@"%02x%02x%02x", (unsigned int)red255, (unsigned int)green255, (unsigned int)blue255];
    
    return [returnString uppercaseString];
}

+ (UIColor *)hex:(NSInteger)hexColor
{
    return [[self class] hex:hexColor alpha:1.0];
}

+ (UIColor *)hex:(NSInteger)hexColor alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((CGFloat)((hexColor & 0xFF0000) >> 16)) / 255.0
                           green:((CGFloat)((hexColor & 0xFF00) >> 8)) / 255.0
                            blue:((CGFloat)(hexColor & 0xFF)) / 255.0
                           alpha:alpha];
}

@end
