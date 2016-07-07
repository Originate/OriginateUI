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

## Text Fields
`UITextField` has no convenient accessors to specify insets for the text rendering or other elements. `OriginateTextField` solves the problem by exposing the following interface:

```objective-c
OriginateTextField *textField = [[OriginateTextField alloc] init];
textField.textEdgeInsets = UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0);
```

### Validating Text Fields
When implementing registration forms, login masks or other types of forms that would benefit from validation, use `OriginateValidatedTextField`.

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
With iOS 7 Apple introduced motion interpolation for views – i.e. you can make your subviews *respond* to device motion by having the system shift them slightly, thereby creating a parallax-like effect. That said, the API is tedious to use, which is why we extended `UIView` and introduced a property called `motionInterpolationEnabled`. It applies a default value and enables `x` and `y` axis shifting.

```objective-c
UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
view.motionInterpolationEnabled = YES;
```

## Image Tinting (Category on UIImage)
To make the *tinting* of images easier, we provide two methods on `UIImage`:

```objective-c
UIImage *logo = [UIImage imageNamed:@"logo"];
UIImage *blackLogo = [logo imageTintedWithColor:[UIColor blackColor]];
```

## Circular Images (Category on UIImage)
To easily make circular images with text, we have a category on `UIImage`:

```objective-c
UIImage *circle = [UIImage circularImageWithText:@\"Example\" textColor:[UIColor hex:0x2B2B2B] backgroundColor:[UIColor hex:0xFF2D55] size:"
"exampleSize];"
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
