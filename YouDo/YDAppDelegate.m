//
//  YDAppDelegate.m
//  YouDo
//
//  Created by Zhanserik Kenes on 04.04.14.
//  Copyright (c) 2014 Kenes. All rights reserved.
//

#import "YDAppDelegate.h"

@implementation YDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [[UITabBar appearance] setBarTintColor:MAIN_COLOR];
    
    UIImage* apperanceImage = [[UIImage imageNamed:@"1x1.png"] imageWithColor:MAIN_COLOR];
    
    [[UINavigationBar appearance] setShadowImage:apperanceImage];
    [[UINavigationBar appearance] setBackgroundImage:apperanceImage
                                     forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setBarTintColor:MAIN_COLOR];
    
    
    return YES;
}
							

@end
