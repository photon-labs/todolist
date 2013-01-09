//
//  AppDelegate.m
//  Task
//
//  Created by Nagarajan on 12/11/12.
//  Copyright (c) 2012 Nagarajan. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "DashBoardViewController.h"
#import "TodoModel.h"
#import "SharedObject.h"
#import "PendingTaskViewController.h"

@implementation AppDelegate

@synthesize window=_window;

@synthesize dashboardViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    dashboardViewController = [[DashBoardViewController alloc] init];
    dashboardViewController.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, [UIScreen mainScreen].applicationFrame.size.height);
    self.dashboardViewController.view.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = self.dashboardViewController;
    [self createEditableCopyOfDatabaseIfNeeded];
    [self.window makeKeyAndVisible];
    return YES;
    
    
}

- (void)createEditableCopyOfDatabaseIfNeeded {
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"ToDo.sqlite"];
    success = [fileManager fileExistsAtPath:writableDBPath];
    if (success) return;
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"ToDo.sqlite"];
    success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    if (!success) {
        NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
    }
}




- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}
- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
   
}

- (void)applicationWillTerminate:(UIApplication *)application
{
   
            
    
}
    

@end