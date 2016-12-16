//
//  AppDelegate.m
//  AppXYZ
//
//  Created by XuJiahua on 2016/12/15.
//  Copyright © 2016年 johntech. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    NSLog(@"url: %@", url);
    NSLog(@"options: %@", options);
    // xyz协议
    if ([[url scheme] isEqualToString:@"xyz"]) {
        // 任务通过host来区分
        if ([url.host isEqualToString:@"success.authorize.com"]) {
            // 参数从query中取
            NSMutableDictionary *queryStringDict = [[NSMutableDictionary alloc] init];
            
            NSString *grantCode;
            
            NSArray *queryCom = [url.query componentsSeparatedByString:@"&"];
            for (NSString *kv in queryCom) {
                NSArray *pair = [kv componentsSeparatedByString:@"="];
                NSString *k = [[pair firstObject] stringByRemovingPercentEncoding];
                NSString *v = [[pair lastObject] stringByRemovingPercentEncoding];
                if ([k isEqualToString:@"code"]) {
                    grantCode = v;
                }
                [queryStringDict setObject:v forKey:k];
            }
            NSLog(@"queryStringDict: %@", queryStringDict);
            
            if (grantCode != nil && ![grantCode isEqualToString:@""]) {
                UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                UINavigationController *nav= (UINavigationController *) [app keyWindow].rootViewController;
                
                MainViewController *main = [storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
                main.grantCode = grantCode;
                [nav pushViewController:main animated:YES];
                
                return YES;
            }
        }
    }
    return NO;
}


@end
