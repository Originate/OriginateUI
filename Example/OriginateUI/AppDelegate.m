//
//  AppDelegate.m
//  OriginateUI
//
//  Created by Philip Kluz on 9/22/15.
//  Copyright (c) 2015 originate.com. All rights reserved.
//

#import "AppDelegate.h"
#import "MyViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    MyViewController *themableViewController = [[MyViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:themableViewController];
    
    self.window.rootViewController = navigationController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
