//
//  BTAppDelegate.m
//  TZImagePickerController
//
//  Created by wudongge on 06/21/2024.
//  Copyright (c) 2024 wudongge. All rights reserved.
//

#import "BTAppDelegate.h"


#import <TZImagePickerController/TZImagePickerController.h>

@implementation BTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 打开下面这句代码，使用导航栏控制器作为rootViewController
    // [self useNavControllerAsRoot];
    return YES;
}

- (void)useNavControllerAsRoot {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];

    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 200, 300, 44)];
    [btn setTitle:@"pushTZImagePickerController" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pushTZImagePickerController) forControlEvents:UIControlEventTouchUpInside];
    [vc.view addSubview:btn];

    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.navigationBar.barStyle = UIBarStyleBlack;
    nav.navigationBar.translucent = YES;
    nav.navigationBar.barTintColor = [UIColor colorWithRed:(34/255.0) green:(34/255.0)  blue:(34/255.0) alpha:1.0];
    nav.navigationBar.tintColor = [UIColor blackColor];
    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance *barAppearance = [[UINavigationBarAppearance alloc] init];
        if (nav.navigationBar.isTranslucent) {
            UIColor *barTintColor = nav.navigationBar.barTintColor;
            barAppearance.backgroundColor = [barTintColor colorWithAlphaComponent:0.85];
        } else {
            barAppearance.backgroundColor = nav.navigationBar.barTintColor;
        }
        barAppearance.titleTextAttributes = nav.navigationBar.titleTextAttributes;
        nav.navigationBar.standardAppearance = barAppearance;
        nav.navigationBar.scrollEdgeAppearance = barAppearance;
    }
    [nav setNavigationBarHidden:YES];

    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
}

- (void)pushTZImagePickerController {
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 columnNumber:4 delegate:nil pushPhotoPickerVc:YES];
    imagePickerVc.modalPresentationStyle = UIModalPresentationFullScreen;
    UINavigationController *nav = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [nav.topViewController presentViewController:imagePickerVc animated:YES completion:nil];
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
