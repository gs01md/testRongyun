//
//  AppDelegate.m
//  testRongCloudIM
//
//  Created by WoodGao on 16/1/8.
//  Copyright © 2016年 wood. All rights reserved.
//

#import "AppDelegate.h"
#import "RongCloudManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    RongCloudManager * rongCloud = [RongCloudManager sharedManager];
    
    ChatListIMViewController* chatlist = [rongCloud chatListView];
    //RCConversationViewController *chatViewController = [rongCloud chatViewWithType:ConversationType_PRIVATE withId:@"2"];
    
    UINavigationController *rootNaviController = [[UINavigationController alloc] initWithRootViewController:chatlist];
    
    self.window.rootViewController = rootNaviController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

@end
