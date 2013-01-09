//
//  AppDelegate.h
//  Task
//
//  Created by Nagarajan on 12/11/12.
//  Copyright (c) 2012 Nagarajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
@class PendingTaskViewController;
@class DashBoardViewController;
@interface AppDelegate : NSObject <UIApplicationDelegate>{
   
   sqlite3 *database;
   DashBoardViewController *dashboardViewController;
  
   
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) DashBoardViewController *dashboardViewController;



-(void) getValuesFromNewTask;
-(void) getValuesFromCompletedTask;


@end
