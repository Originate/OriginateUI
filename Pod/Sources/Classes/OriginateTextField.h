//
//  OriginateTextField.h
//  OriginateUI
//
//  Created by Philip Kluz on 7/7/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

@import UIKit;

@interface OriginateTextField : UITextField

#pragma mark - Properties
@property (nonatomic, assign, readwrite) UIEdgeInsets textEdgeInsets;
@property (nonatomic, assign, readwrite) UIEdgeInsets rightViewInsets;
@property (nonatomic, assign, readwrite) UIEdgeInsets leftViewInsets;
@property (nonatomic, assign, readwrite) UIEdgeInsets clearButtonEdgeInsets;

@end
