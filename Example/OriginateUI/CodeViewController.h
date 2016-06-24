//
//  CodeViewController.h
//  OriginateUI
//
//  Created by Seth Rainha on 6/22/16.
//  Copyright © 2016 originate.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CodeViewController : UIViewController

<UITextViewDelegate>
@property UITextView *textView;
@property NSString *myString;

@end
