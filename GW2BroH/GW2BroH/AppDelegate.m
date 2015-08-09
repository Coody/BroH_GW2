//
//  AppDelegate.m
//  GW2BroH
//
//  Created by CoodyChou on 2015/5/23.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewControllerTabBar.h"

#import <Parse/Parse.h>

#import "Constants.h"

@interface AppDelegate ()

@property (nonatomic , strong) UINavigationController *navController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [Parse enableLocalDatastore];
    
    // Initialize Parse.
    [Parse setApplicationId:GW2_PARSE_APP_ID
                  clientKey:GW2_PARSE_CLIENT_KEY];
    
    // [Optional] Track statistics around application opens.
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    /* 設定 bundle */
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    /* 背景顏色 */
    self.window.backgroundColor = [UIColor blackColor];
    
    /* status bar style */
    [[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleDefault];
    
    /* custom tab bar controller */
    ViewControllerTabBar *tabBarController = [[ViewControllerTabBar alloc] init];
    
//    /* 設定 navigation controller 為 custom tab bar controller ,
//     請參考：https://developer.apple.com/library/prerelease/ios/documentation/WindowsViews/Conceptual/ViewControllerCatalog/Chapters/NavigationControllers.html 
//     */
//    self.navController = [[UINavigationController alloc] initWithRootViewController:tabBarController];
//    
//    /* 先隱藏 */
//    self.navController.navigationBarHidden = YES;
    
    /* 讓 rootViewController 裝入 navigation controller */
    self.window.rootViewController = tabBarController;
    
    //
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
