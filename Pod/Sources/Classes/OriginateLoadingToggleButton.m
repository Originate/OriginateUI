//
//  OriginateLoadingToggleButton.m
//  OriginateUI
//
//  Created by Allen Wu on 10/30/15.
//  Copyright © 2015 Originate. All rights reserved.
//

#import "OriginateLoadingToggleButton.h"
#import "UIImage+OriginateTinting.h"

@interface OriginateLoadingToggleButton ()

@property (nonatomic, strong) UIImage *offImage;
@property (nonatomic, strong) UIImage *onImage;
@property (nonatomic, strong) UIImage *offImageTinted;
@property (nonatomic, strong) UIImage *onImageTinted;

@property (nonatomic, strong) UIImageView *offImageView;
@property (nonatomic, strong) UIImageView *onImageView;

@property (nonatomic, strong) UIActivityIndicatorView *spinner;
@property (nonatomic, assign) UIActivityIndicatorViewStyle spinnerStyle;

// Hack - don't use Auto Layout when initialized with an
// explicit frame. When this button is used within a
// UIBarButtonItem (which doesn't inherit from UIView),
// strange things happen.
@property (nonatomic, assign) BOOL shouldUseAutoLayout;

@end

@implementation OriginateLoadingToggleButton

- (CGSize)intrinsicContentSize
{
    return CGSizeMake(40, 40);
}


#pragma mark - ARTLoadingToggleButton

- (instancetype)initWithFrame:(CGRect)frame
                     offImage:(UIImage *)offImage
                      onImage:(UIImage *)onImage
                 spinnerStyle:(UIActivityIndicatorViewStyle)spinnerStyle;
{
    self = [super initWithFrame:frame];
    
    if (self) {
        if (CGRectIsEmpty(frame)) {
            _shouldUseAutoLayout = YES;
        }
        
        _offImage = offImage;
        _onImage = onImage;
        _spinnerStyle = spinnerStyle;
        
        _on = NO;
        
        [self addSubview:self.offImageView];
        [self addSubview:self.onImageView];
        [self addSubview:self.spinner];
        
        if (_shouldUseAutoLayout) {
            self.translatesAutoresizingMaskIntoConstraints = NO;
            self.offImageView.translatesAutoresizingMaskIntoConstraints = NO;
            self.onImageView.translatesAutoresizingMaskIntoConstraints = NO;
            self.spinner.translatesAutoresizingMaskIntoConstraints = NO;
            
            [self setupConstraints];
        }
    }
    
    return self;
}

- (void)setupConstraints
{
    NSArray *subviews = @[self.offImageView, self.onImageView, self.spinner];
    
    for (UIView *subview in subviews) {
        [self addConstraint:[NSLayoutConstraint constraintWithItem:subview
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:subview
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:subview
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:nil
                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                        multiplier:1
                                                          constant:self.offImageView.image.size.width]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:subview
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:nil
                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                        multiplier:1
                                                          constant:self.offImageView.image.size.height]];
    }
}

- (void)setOn:(BOOL)on
{
    _on = on;
    
    [self.spinner stopAnimating];
    self.spinner.alpha = 0;
    
    self.offImageView.hidden = on;
    self.onImageView.hidden = !on;
}

- (void)setLoading
{
    [self.spinner startAnimating];
    [UIView animateWithDuration:0.2
                          delay:0.1
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.spinner.alpha = 1;
                     } completion:nil];
    
    self.offImageView.hidden = YES;
    self.onImageView.hidden = YES;
}


#pragma mark - UIControl

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    
    self.offImageView.image = highlighted ? self.offImageTinted : self.offImage;
    self.onImageView.image  = highlighted ? self.onImageTinted  : self.onImage;
}


#pragma mark - Subviews

- (UIImageView *)offImageView
{
    if (!_offImageView) {
        _offImageView = [[UIImageView alloc] initWithImage:self.offImage];
        _offImageView.contentMode = UIViewContentModeScaleAspectFit;
        _offImageView.hidden = NO;
        _offImageView.frame = self.frame;
        _offImageView.center = self.center;
    }
    return _offImageView;
}

- (UIImageView *)onImageView
{
    if (!_onImageView) {
        _onImageView = [[UIImageView alloc] initWithImage:self.onImage];
        _onImageView.contentMode = UIViewContentModeScaleAspectFit;
        _onImageView.hidden = YES;
        _onImageView.frame = self.frame;
        _onImageView.center = self.center;
    }
    return _onImageView;
}

- (UIActivityIndicatorView *)spinner
{
    if (!_spinner) {
        _spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:self.spinnerStyle];
        _spinner.hidesWhenStopped = YES;
        _spinner.frame = self.frame;
        _spinner.center = self.center;
        _spinner.alpha = 0;
        [_spinner stopAnimating];
    }
    return _spinner;
}


#pragma mark -

- (UIImage *)onImageTinted
{
    if (!_onImageTinted) {
        _onImageTinted = [self.onImage imageTintedWithColor:[UIColor grayColor]];
    }
    return _onImageTinted;
}

- (UIImage *)offImageTinted
{
    if (!_offImageTinted) {
        _offImageTinted = [self.offImage imageTintedWithColor:[UIColor grayColor]];
    }
    return _offImageTinted;
}

@end