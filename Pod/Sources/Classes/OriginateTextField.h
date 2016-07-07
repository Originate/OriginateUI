//
//  OriginateTextField.h
//  OriginateUI
//
//  Created by Philip Kluz on 7/7/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

@import UIKit;

IB_DESIGNABLE

@interface OriginateTextField : UITextField

#pragma mark - Properties
@property (nonatomic, assign, readwrite) IBInspectable UIEdgeInsets textEdgeInsets;
@property (nonatomic, assign, readwrite) IBInspectable UIEdgeInsets rightViewInsets;
@property (nonatomic, assign, readwrite) IBInspectable UIEdgeInsets leftViewInsets;
@property (nonatomic, assign, readwrite) IBInspectable UIEdgeInsets clearButtonEdgeInsets;

@end
