//
//  InstallationViewController.m
//  OriginateUI
//
//  Created by Seth Rainha on 6/22/16.
//  Copyright © 2016 originate.com. All rights reserved.
//

#import "InstallationViewController.h"
#import "CodeViewController.h"
@import OriginateUI;

@interface InstallationViewController ()

@property UILabel *instLabel;
@property UILabel *reqLabel;
@property UILabel *useLabel;
@property UILabel *label1;
@property UILabel *label2;
@property UILabel *label3;
@property UILabel *label4;
@property UITextView *textView1;
@property UITextView *textView2;

@end

@implementation InstallationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"Installation";
    [self labelCreate];
    [self textFieldCreate];
}

- (void)labelCreate
{
    int screenHeight = self.view.frame.size.height;
    int screenWidth = self.view.frame.size.width;
    //instLabel setup
    self.instLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, screenHeight*0.2, screenWidth*0.8, 50.0)];
    self.instLabel.text = @"Install with CocoaPods";
    self.instLabel.textColor = [UIColor whiteColor];
    self.instLabel.font = [UIFont fontWithName:@"CircularPro-Medium" size:22];
    self.instLabel.numberOfLines = 0;
    [self.view addSubview:self.instLabel];
    //reqLabel setup
    self.reqLabel = [[UILabel alloc] initWithFrame:CGRectMake(10., screenHeight*0.45, screenWidth*0.8, 50.0)];
    self.reqLabel.text = @"Requirements";
    self.reqLabel.textColor = [UIColor whiteColor];
    self.reqLabel.font = [UIFont fontWithName:@"CircularPro-Medium" size:22];
    self.reqLabel.numberOfLines = 0;
    [self.view addSubview:self.reqLabel];
    //useLabel setup
    self.useLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, screenHeight*0.6, screenWidth*0.8, 50.0)];
    self.useLabel.text = @"Usage: Import the Framework";
    self.useLabel.textColor = [UIColor whiteColor];
    self.useLabel.font = [UIFont fontWithName:@"CircularPro-Medium" size:22];
    self.useLabel.numberOfLines = 0;
    [self.view addSubview:self.useLabel];
    //label1 setup
    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(20.0, screenHeight*0.25, screenWidth*0.8, 50.0)];
    self.label1.text = @"Add the following lines to your Podfile and run pod install.";
    self.label1.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 14];
    self.label1.numberOfLines = 0;
    [self.view addSubview:self.label1];
    //label2 setup
    self.label2 = [[UILabel alloc] initWithFrame:CGRectMake(20.0, screenHeight*0.5, screenWidth*0.8, 50.0)];
    self.label2.text = @"iOS 8.0+";
    self.label2.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 14];
    self.label2.numberOfLines = 0;
    [self.view addSubview:self.label2];
    //label3 setup
    self.label3 = [[UILabel alloc] initWithFrame:CGRectMake(20.0, screenHeight*0.65, screenWidth*0.8, 50.0)];
    self.label3.text = @"Add the following line wherever you want to access the framework:";
    self.label3.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 14];
    self.label3.numberOfLines = 0;
    [self.view addSubview:self.label3];
    //label4 setup
    self.label4 = [[UILabel alloc] initWithFrame:CGRectMake(20.0, screenHeight*0.825, screenWidth*0.8, 85.0)];
    self.label4.text = @"You now have access to a wide range of categories and classes that simplify everyday life when writing user interface related code.";
    self.label4.font = [UIFont fontWithName:@"MillerDisplay-Roman" size: 14];
    self.label4.numberOfLines = 0;
    [self.view addSubview:self.label4];
}

- (void)textFieldCreate
{
    int screenHeight = self.view.frame.size.height;
    int screenWidth = self.view.frame.size.width;
    //textView1 setup
    self.textView1 = [[UITextView alloc] initWithFrame:CGRectMake(40.0, (screenHeight*0.35), (screenWidth-80.0), (screenHeight*0.075))];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.textView1 setReturnKeyType:UIReturnKeyDone];
    self.textView1.delegate = self;
    self.textView1.text = @"source 'https://github.com/Originate/CocoaPods.git'"
    "pod 'OriginateUI'";
    [self.view addSubview:self.textView1];
    //textView2 setup
    self.textView2 = [[UITextView alloc] initWithFrame:CGRectMake(40, (self.view.frame.size.height*.75), (self.view.frame.size.width-80), (self.view.frame.size.height*.075))];
    [self.textView2 setReturnKeyType:UIReturnKeyDone];
    self.textView2.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.textView2.text = @"@import OriginateUI;";
    [self.view addSubview:_textView2];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (range.length==0) {
        if ([text isEqualToString:@"\n"]) {
            [textView resignFirstResponder];
            return NO;
        }
    }
    return YES;
}

@end
