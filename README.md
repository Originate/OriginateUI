# OriginateUI
[![CI Status](http://img.shields.io/travis/Originate/OriginateUI.svg?style=flat)](https://travis-ci.org/Originate/OriginateUI)

> A collection of classes and categories making life easier when writing user interface related code.

# Installation with CocoaPods
Add the following lines to your Podfile and run `pod install`.

```ruby
source 'https://github.com/Originate/CocoaPods.git'
pod 'OriginateUI'
```

# Requirements
- iOS 8.0+

# Usage

## Import the Framework

Add the following line wherever you want to access the framework:
```objective-c
@import OriginateUI;
```

You now have access to a wide range of categories and classes that simplify everyday life when writing user interface related code.

## Themes

OriginateUI introduces the concept of a `theme`. A theme is specified using `json` and describes the basic look and feel of your application:

```javascript
// Theme.json
{
    "fonts" : {
        "default" : {
            "name" : "HelveticaNeue",
            "size" : 15.0
        },
        "defaultBold" : {
            "name" : "HelveticaNeue-Bold",
            "size" : 15.0
        },
        "defaultSmall" : {
            "name" : "HelveticaNeue-Thin",
            "size" : 11.0
        },
        ...
    },
    "colors" : {
        "primary" : "EFEFEF",
        "secondary" : "636363",
        ...
    },
    "components" : {
        "navigationBar" : {
            "backgroundColor" : "84E0FA",
            "textColor" : "000000"
        },
        "tabBar" : {
            "backgroundColor" : "FFFFFF",
            "textColor" : "424242",
            "selectedTextColor" : "4C66A4"
        },
        ...
    }
}
```

Creating your own theme is easy:

```objective-c
@import OriginateUI;

@interface AppTheme : OriginateTheme

@end

@implementation AppTheme

- (instancetype)init
{
    NSURL *themeURL = [[NSBundle mainBundle] URLForResource:@"Theme" withExtension:@"json"];
    self = [super initWithStyleDefinitionFileAtURL:themeURL];
    return self;
}

@end
```

Typically you would now extend your theme to map the generic properties (`primaryColor`, `secondaryColor`,…) to custom - more specific – ones. `primaryColor` carries fairly little information as to where it is supposed to be used, which is why it is reasonable to prepare a more specific interface.

```objective-c
- (UIColor *)linkColor
{
    return self.colors.primaryColor;
}
```

With this, you have an application specific abstraction on top of the  underlying JSON theme file.

## Text Fields
`UITextField` has no convenient accessors to specify insets for the text rendering or other elements. `OriginateTextField` solves the problem by exposing the following interface:

```objective-c
OriginateTextField *textField = [[OriginateTextField alloc] init];
textField.textEdgeInsets = UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0);
```

### Validating Text Fields
When implementing registration forms, login masks or other types of forms that would benefit from validation, use `OriginateVlidatedTextField`.

```objective-c
OriginateValidatedTextField * textField = [[OriginateValidatedTextField alloc] init];
textField.validationMode = OriginateTextFieldValidationModeLive;
textField.validationBlock = ^BOOL(NSString *text) {
    return ([text length] > 5);
};
textField.validationChangedBlock = ^(BOOL isValid, OriginateValidatedTextField *textField) {
    if (isValid) {
        textField.backgroundColor = [UIColor whiteColor];
    }
    else {
        textField.backgroundColor = [UIColor redColor];
    }
};
```

## Gradient Views
Whilst `CoreAnimation` provides us with `CAGradientLayer` it is not as comfortable to use as one would like. For this reason we supply `OriginateGradientView`.

```objective-c
UIColor *topColor = [UIColor whiteColor];
UIColor *blackColor = [UIColor blackColor];
OriginateGradientView *view = [[OriginateGradientView alloc] initWithFirstColor:topColor secondColor:blackColor];
```

## Motion Interpolation (Category on UIView)
Since iOS 7 Apple supports custom motion interpolation for views – i.e. you can make your subviews *respond* to device motion by shifting them slightly, thereby creating a parallax-like effect. That said, the API is tedious to use, which is why we extended `UIView` and introduced a property called `motionInterpolationEnabled`. It applies a default value and enables `x` and `y` axis shifting.

```objective-c
UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
view.motionInterpolationEnabled = YES;
```

## Image Tinting (Category on UIImage)
To make the *tinting* of images easier, we provide to methods on `UIImage`:

```objective-c
UIImage *logo = [UIImage imageNamed:@"logo"];
UIImage *blackLogo = [logo imageTintedWithColor:[UIColor blackColor]];
```

## Hexadecimal Colors (Category on UIColor)
Most designers work with colors using the hexadecimal system. `UIColor` by default only really works well with plain RGB values between 0 and 1.

```objective-c
// Red
UIColor *redColor = [UIColor hex:0xFF0000];

// Green at 50% Opacity
UIColor *redColor = [UIColor hex:0x00FF00 alpha:0.5];
```

# License
OriginateUI is available under the MIT license. See the LICENSE file for more info.
